const async = require('async');
const url = require('url');
const https = require('https');
const crypto = require('crypto');
const utils = require('./utils');
const querystring = require('querystring');
// const applicationContext = require('applicationcontext');


/**
 * @type {*|exports|module.exports}
 * 工具类，通用功能
 */
var
    // setting = require('./settings'),
    http = require("http"),
    // error = require('./errors'),
    fs = require('fs');
//拼音
// const pinyin = require('pinyin');


exports.getPinyin = function (name) {
    let names = "";
    let b = pinyin(name, {
        style: pinyin.STYLE_FIRST_LETTER,
        // heteronym: true
    });
    console.log(b);
    for (let i = 0; i < b.length; i++) {
        // console.log(b[i])
        for (let j = 0; j < b[i].length; j++) {
            // console.log(b[i][j]);
            names = names + b[i][j];
        }

    }
    console.log(names);
    return names;
};


//获取手机验证码
exports.getVerifiCode = function (phoneNo, phones, clientIp, ips) {
    //是否获取到ip
    if (!clientIp) return errors.e113;
    //验证是否输入了手机号
    if (!phoneNo) return errors.e109;
    var c1 = checkIp(clientIp, phones);
    var c2 = checkPhoneNo(phoneNo, ips);
    if (c1 == false) {
        return errors.e103;
    } else if (c2 == false) {
        return errors.e103;
    } else if (c1 && c2) {
        var verificode = Math.floor(Math.random() * (9999 - 1000) + 1000);
        applicationContext.set(phoneNo, {verificode: verificode, time1: Date.now()});
        console.log('haomiaoshu', Date.now());
        //将生成的verifiCode发送给手机短信接口
        var msgAddr = setting.verifiCodeParameter.msgAddr;
        var account = setting.verifiCodeParameter.account;
        var pswd = setting.verifiCodeParameter.pswd;
        var msgPrefix = setting.verifiCodeParameter.msgPrefix;
        var msgSuffix = setting.verifiCodeParameter.msgSuffix;
        var needstatus = setting.verifiCodeParameter.needstatus;
        //var chuanglan = "http://222.73.117.158/msg/HttpBatchSendSM?" +
        //    "account=jiekou-clcs-03&pswd=Admin789&mobile=13571887045&msg=%E6%82%A8%E5%A5%BD%EF%BC%8C%E6%82%A8%E7%9A%84%E9%AA%8C%E8%AF%81%E7%A0%81%E6%98%AF9898&needstatus=false";
        var chuanglan = msgAddr + "account=" + account + "&pswd=" + pswd + "&mobile=" + phoneNo + "&msg=" + msgPrefix + verificode + msgSuffix + "&needstatus=" + needstatus;
        console.log(encodeURI(chuanglan));
        http.get(encodeURI(chuanglan), function (result) {
            console.log('chuanlan:', result.statusCode);
        });
        return errors.e0;
    }
};

var checkPhoneNo = function (phoneNo, phones) {
    //检验同一手机号访问次数
    var index = phones.indexOf(phoneNo);
    if (index == -1) {
        phones.push(phoneNo);
        phones.splice(phones.indexOf(phoneNo) + 1, 0, 1);
        return true;
    } else if (phones[index + 1] == setting.verifiCodeParameter.phoneLimit) {
        return false;
    } else {
        phones.splice(index + 1, 1, phones[index + 1] + 1);
        return true;
    }
};

var checkIp = function (clientIp, ips) {
    //检验同一IP访问次数
    var index = ips.indexOf(clientIp);
    if (index == -1) {
        ips.push(clientIp);
        ips.splice(ips.indexOf(clientIp) + 1, 0, 1);
        return true;
    } else if (ips[index + 1] == setting.verifiCodeParameter.ipLimit) {
        return false;
    } else {
        ips.splice(index + 1, 1, ips[index + 1] + 1);
        return true;
    }
};


/**
 * 排班表  数据分组
 */

exports.scheduling = (data)=> {
    var map = {},
        dest = [];
    for (var i = 0; i < data.length; i++) {
        var ai = data[i];
        if (!map[ai.section]) {
            dest.push({
                data: [ai]
            });
            map[ai.section] = ai;

        } else {
            for (var j = 0; j < dest.length; j++) {
                var dj = dest[j];
                if (dj.data[0].section == ai.section) {
                    dj.data.push(ai);
                    break;
                }
            }
        }
    }

    // console.log("dest:",dest);

    return dest;
};


/**
 * 数组去重
 */
exports.distinctArr = (arr)=> {


    let setArr = new Set(arr);
    // console.log("----------setArr----",setArr);
    let newArr = [];
    setArr.forEach(function (e) {
        newArr.push(e);
    });
    // console.log(newArr,'----newArr---');
    return newArr;

};


//主要用来取socket内置的json数据结构长度
exports.getJsonLength = function (jsonData) {
    //linux下面的io.sockets.adapter.rooms结构没有带length属性，但是windows下面有length属性
    var jsonLength = 0;
    for (var item in jsonData)
        jsonLength++;
    return jsonLength;
};

//将origin中的键值对赋给target
exports.combineJson = function (origin, target) {
    // console.log("origin:",origin);
    // console.log("target:",target);
    if (origin && target) {
        for (var p in origin) {
            //var name=p;//属性名称
            //var value=origin[p];//属性对应的值
            target[p] = origin[p];
        }

        return target;
    } else {
        return origin;
    }


};

//将数组中的字符串转为数字，如[ '26', '27', '34', '35' ]，转为[ 26, 27, 34, 35 ]
exports.turnStringToNumberInArray = function (target) {
    let newArray = [];
    target.forEach(function (item) {
        newArray.push(parseInt(item))
    });
    return newArray;
};

//数组合并
exports.addArray = function (array1, array2) {
    // if(!array1||!array2){
    //     return "传入值不能为空"
    // }
    // if(array1==array2){
    //     return "数组相同"
    // }
    for (let i = 0; i < array2.length; i++) {
        array1.push(array2[i]);
    }
    return array1;
};


//将毫秒数转化为时长
exports.MillisecondToDate = function (msd) {
    var time = parseFloat(msd) / 1000;
    if (null != time && "" != time) {
        if (time > 60 && time < 60 * 60) {
            time = "00:" + parseInt(time / 60.0).FullZero() + ":" + (parseInt((parseFloat(time / 60.0) -
                    parseInt(time / 60.0)) * 60)).FullZero();
        } else if (time >= 60 * 60 && time < 60 * 60 * 24) {
            time = parseInt(time / 3600.0).FullZero() + ":" + (parseInt((parseFloat(time / 3600.0) -
                    parseInt(time / 3600.0)) * 60)).FullZero() + ":" +
                (parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
                    parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60)).FullZero();
        } else {
            time = "00:00:" + parseInt(time).FullZero();
        }
    }
    return time;
};

Number.prototype.FullZero = function () {
    return this > 10 ? this : "0" + this;
};


exports.getClientIp = function (req) {
    return req.headers['x-forwarded-for'] ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress;
};

/*
 时间字符串转时间,支持时间戳、字符串等
 */
String.prototype.ToDate = function () {
    var seed = this.replace("/Date(", "").replace(")/", "");
    seed = /^\d*$/.test(seed) ? parseInt(seed) : seed;
    return new Date(seed);
};


/*
 时间格式化
 格式 YYYY/yyyy/YY/yy 表示年份
 MM/M 月份
 W/w 星期
 dd/DD/d/D 日期
 hh/HH/h/H 时间
 mm/m 分钟
 ss/SS/s/S 秒
 */
Date.prototype.ToString = function (str) {
    var Week = ['日', '一', '二', '三', '四', '五', '六'];
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));
    str = str.replace(/MM/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
    str = str.replace(/M/g, this.getMonth() + 1);
    str = str.replace(/w|W/g, Week[this.getDay()]);
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    str = str.replace(/d|D/g, this.getDate());
    str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
    str = str.replace(/h|H/g, this.getHours());
    str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
    str = str.replace(/m/g, this.getMinutes());
    str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
    str = str.replace(/s|S/g, this.getSeconds());
    return str;
};

/**
 * Date.Now()转换为时间
 *
 */

exports.numberToDate = function (time) {
    var d = new Date(parseInt(time));
    let mm = d.getMinutes();
    let ss = d.getSeconds();
    if (mm < 10) {
        mm = "0" + mm;
    }
    if (ss < 10) {
        ss = "0" + ss;
    }


    var showtime = d.getFullYear() + '年' + (d.getMonth() + 1) + '月' + d.getDate() + '日' + " " + d.getHours() + ":" + mm + ":" + ss;
    return showtime;
};

/**
 * Date.Now()转换为时间  年  月  日
 *
 */

exports.numberToDate1 = function (time) {
    var d = new Date(parseInt(time));
    let mm = d.getMinutes();
    let ss = d.getSeconds();
    if (mm < 10) {
        mm = "0" + mm;
    }
    if (ss < 10) {
        ss = "0" + ss;
    }


    var showtime = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
    return showtime;
};

exports.fillZero = function (numberOfDays, data) {
    let getDate = function (timestamp) {
        let date = new Date(timestamp);
        let year = date.getFullYear();
        let month = date.getMonth() >= 10 ? (date.getMonth() + 1) : '0' + (date.getMonth() + 1);
        let day = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate();
        let time = year + '-' + month + '-' + day;
        return time;
    };
    let category = [];
    let value = [];
    let startDate = Date.now() - 1000 * 60 * 60 * 24 * (numberOfDays-1);
    for (i = 0; i < numberOfDays; i++) {
        let d = getDate(startDate + 60 * 60 * 24 * 1000 * i);
        //将日期放入横轴数组
        category.push(d.substring(5));
        let flag = true;
        //将数据放入纵轴数组
        data.forEach(function (item) {
            if (d == item.date) {
                value.push(item.number);
                flag = false;
            }
        });
        //遍历发现data中不存在对应d的日期
        if (flag) {
            value.push(0);
        }
    }

    return {category: category, value: value}
    
};

/**
 * 
 * 统计24小时的数据
 */

exports.one_day = function (data) {
    // let category = [];
    let value = [];
    let hour = -1;
    for (i = 0; i < 24; i++) {
        hour=hour+1;
        console.log("hour---",hour);
        let flag = true;
        //将数据放入纵轴数组
        data.forEach(function (item) {
            if (hour == item._id) {
                value.push(item.number);
                flag = false;
            }
        });
        //遍历发现data中不存在对应d的日期
        if (flag) {
            value.push(0);
        }
    }

    return {value: value}

};




//获取当前的年月日时分秒
exports.getTime = function () {
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() > 10 ? (date.getMonth() + 1) : '0' + (date.getMonth() + 1);
    let day = date.getDate() > 10 ? date.getDate() : '0' + date.getDate();
    let hour = date.getHours() > 10 ? date.getHours() : '0' + date.getHours();
    let minutes = date.getMinutes() > 10 ? date.getMinutes() : '0' + date.getMinutes();
    let second = date.getSeconds() > 10 ? date.getSeconds() : '0' + date.getSeconds();
    let time = year + '-' + month + '-' + day + ' ' + hour + ':' + minutes + ':' + second;
    return time;

};


/**
 * 健康指导单号
 */
exports.getGuidanceNo = function () {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minutes = date.getMinutes();
    var second = date.getSeconds();
    if (month < 10) {
        month = '0' + month
    }
    if (day < 10) {
        day = '0' + day
    }
    if (hour < 10) {
        hour = '0' + hour
    }
    if (minutes < 10) {
        minutes = '0' + minutes
    }
    if (second < 10) {
        second = '0' + second
    }
    var time = year + month + day + hour + minutes + second;
    let num = "";
    for (let i = 0; i < 3; i++) {
        num += Math.floor(Math.random() * 10)
    }


    let No = time.substring(4, 14);
    let guidanceNo = No + num;
    return guidanceNo;

};


/**
 * 辅助检查编号 Inspect
 */
exports.getInspectNo = function () {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minutes = date.getMinutes();
    var second = date.getSeconds();
    if (month < 10) {
        month = '0' + month
    }
    if (day < 10) {
        day = '0' + day
    }
    if (hour < 10) {
        hour = '0' + hour
    }
    if (minutes < 10) {
        minutes = '0' + minutes
    }
    if (second < 10) {
        second = '0' + second
    }
    var time = year + month + day + hour + minutes + second;
    let num = "";
    for (let i = 0; i < 5; i++) {
        num += Math.floor(Math.random() * 10)
    }


    let No = time.substring(6, 14);
    let inspectNo = No + num;
    return inspectNo;

};


/**
 * 订单编号：生成规则如：今天是2017年6月6日10点44分10秒 那么订单号是：170606104410123  后面3位是随机数.
 */
exports.getPrescriptionNo = function () {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minutes = date.getMinutes();
    var second = date.getSeconds();
    if (month < 10) {
        month = '0' + month
    }
    if (day < 10) {
        day = '0' + day
    }
    if (hour < 10) {
        hour = '0' + hour
    }
    if (minutes < 10) {
        minutes = '0' + minutes
    }
    if (second < 10) {
        second = '0' + second
    }
    var time = year + month + day + hour + minutes + second;
    let num = "";
    for (let i = 0; i < 3; i++) {
        num += Math.floor(Math.random() * 10)
    }


    let No = time.substring(2, 14);
    let prescriptionNo = No + num;
    return prescriptionNo;

};

/**
 * 删除数组对象  by Name;
 */

exports.removeValue = (arr, obj)=> {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].fileName == obj) {
            arr.splice(i, 1);
            return arr;
        }
        if (i == arr.length) {
            return arr;
        }

    }

}

//查找

exports.findValue = (arr, obj)=> {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].name == obj) {
            return 0;
        }
    }

};


/**
 * 判断元素是否在该数组内(在本文是判断患者是否已经在队列中)
 */
exports.contains = (arr, obj) => {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].recordId == obj) {
            return true;
        }
    }
    return false;
};


/**
 * 判断元素是否在该数组内
 */
exports.myContains = (arr, obj) => {
    for (let i = 0; i <= arr.length; i++) {
        if (arr[i] == obj) {
            return true;
        }
    }
    return false;
};


/**
 * 数组去重 （推荐）
 */
exports.unique = function (arr) {
    var res = [];
    var json = {};
    for (var i = 0; i < arr.length; i++) {
        if (!json[arr[i]]) {
            res.push(arr[i]);
            json[arr[i]] = 1;
        }
    }
    return res;
};


/**
 * 将指定元素从数组中去除(用在本项目是去除recordId)
 */
exports.removeByValue = (arr, obj) => {
    console.log(arr, obj, "----utils---");
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].recordId == obj) {
            arr.splice(i, 1);
            return arr;
        }
    }
    return arr;
};


exports.removeByValue1 = (arr, obj) => {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == obj) {
            arr.splice(i, 1);
            break;
        }
    }
};

/**
 * 删除数组对象  by fileName;
 */

exports.removeValue = (arr, obj)=> {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].fileName == obj) {
            arr.splice(i, 1);
            break;
        }
    }

}


/**
 * 去除在数组中的指定元素
 * @param arr
 * @param obj
 */
exports.removeByValue1 = (arr, obj) => {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == obj) {
            arr.splice(i, 1);
            break;
        }
    }
};

/**
 * 返回元素在该数组内的下标
 */
exports.elementInArrayIndex = (arr, obj) => {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].recordId == obj) {
            return i;
        }
    }
};

/**
 * 生成随机数
 * @param len
 * @returns {string}
 */
exports.randomString = (len) => {
    len = len || 32;
    var $chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var maxPos = $chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
};

/**
 * 网易云信IM即时通讯 发送普通消息
 */
exports.IMSendMsg = (from, to, attach, callback) => { //from, ope, to, attach, 
    let appKey = 'a75f33782cc86bb776d97d5ae2d7a2f8';
    let appSecret = '5563b18243de';
    let regUrl = "https://api.netease.im/nimserver/msg/sendMsg.action";
    let post_option = url.parse(regUrl);
    post_option.method = 'POST';
    let post_data = querystring.stringify({
        'from': from,
        'ope': 0,
        'type': 0,
        'to': to,
        'body': attach
    });
    // 对参数进行一系列操作
    let curTime = (Math.round(Date.now() / 1000)).toString(); // 获取时间戳 单位为秒。
    let nonce = utils.randomString(32); // 获取随机数。
    let str = appSecret + "" + nonce + "" + curTime;
    let checkSum = crypto.createHash('sha1').update(str).digest('hex');
    // 请求头
    post_option.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'AppKey': appKey,
        'Nonce': nonce,
        'CurTime': curTime,
        'CheckSum': checkSum,
    };
    let post_req = https.request(post_option, (response) => {
        response.setEncoding("utf8");
        response.on('data', function (buffer) {
            callback(null, buffer);
        });
    });
    post_req.write(post_data);
    post_req.end();

};

/**
 * 网易云信IM即时通讯 自定义系统通知
 */
exports.IMSystemNotice = (from, to, attach, callback) => {
    let appKey = 'a75f33782cc86bb776d97d5ae2d7a2f8';
    let appSecret = '5563b18243de';
    let regUrl = "https://api.netease.im/nimserver/msg/sendAttachMsg.action";
    let post_option = url.parse(regUrl);
    post_option.method = 'POST';
    let post_data = querystring.stringify({
        'from': from,
        'msgtype': 0,
        'to': to,
        'attach': attach
    });
    // 对参数进行一系列操作
    let curTime = (Math.round(Date.now() / 1000)).toString(); // 获取时间戳 单位为秒。
    let nonce = utils.randomString(32); // 获取随机数。
    let str = appSecret + "" + nonce + "" + curTime;
    let checkSum = crypto.createHash('sha1').update(str).digest('hex');
    // 请求头
    post_option.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'AppKey': appKey,
        'Nonce': nonce,
        'CurTime': curTime,
        'CheckSum': checkSum,
    };
    let post_req = https.request(post_option, (response) => {
        response.setEncoding("utf8");
        response.on('data', function (buffer) {
            callback(null, buffer);
        });
    });
    post_req.write(post_data);
    post_req.end();

};


/**
 * 网易云信IM即时通讯 创建accid并返回token
 */
exports.IMCreateToken = (accid, name, callback) => {
    let appKey = 'a75f33782cc86bb776d97d5ae2d7a2f8'; // a75f33782cc86bb776d97d5ae2d7a2f8  a75f33782cc86bb776d97d5ae2d7a2f8
    let appSecret = '5563b18243de'; //5563b18243de
    let regUrl = "https://api.netease.im/nimserver/user/create.action"; // https://api.netease.im/nimserver/user/create.action
    let post_option = url.parse(regUrl);
    post_option.method = 'POST';
    let post_data = querystring.stringify({
        'accid': accid,
        'name': name
    });
    // 对所需的参数进行处理
    let curTime = (Math.round(Date.now() / 1000)).toString(); // 获取时间戳 单位为秒。
    let nonce = utils.randomString(32); // 获取随机数。
    let str = appSecret + nonce + curTime + "";
    let checkSum = crypto.createHash('sha1').update(str).digest('hex');
    // 请求头
    post_option.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'AppKey': appKey,
        'Nonce': nonce,
        'CurTime': curTime,
        'CheckSum': checkSum,
    };
    let post_req = https.request(post_option, (response) => {
        response.setEncoding("utf8");
        response.on('data', function (buffer) {
            console.log(buffer)
            callback(null, buffer);
        });
    });
    post_req.write(post_data);
    post_req.end();

};

/**
 * 修改医生的闲 忙 繁忙状态
 */
exports.doctorState = (userId, state, callback) => {
    User.update({_id: userId}, {
        state: state
    }, (err) => {
        if (err) throw err;
        callback(null, errors.e0);
    })

};


// /**
//  * 网易云信IM即时通讯 自定义系统通知
//  */
// exports.IMSystemNotice = (from, to, attach, callback) => {
// 	let appKey = 'a75f33782cc86bb776d97d5ae2d7a2f8';
// 	let appSecret = '5563b18243de';
// 	let regUrl = "https://api.netease.im/nimserver/msg/sendAttachMsg.action";
// 	let post_option = url.parse(regUrl);
// 	post_option.method = 'POST';
// 	let post_data = querystring.stringify({
// 		'from': from,
// 		'msgtype': 0,
// 		'to': to,
// 		'attach': attach
// 	});
// 	// 对参数进行一系列操作
// 	let curTime = (Math.round(Date.now() / 1000)).toString(); // 获取时间戳 单位为秒。
// 	let nonce = utils.randomString(32); // 获取随机数。
// 	let str = appSecret + "" + nonce + "" + curTime;
// 	let checkSum = crypto.createHash('sha1').update(str).digest('hex');
// 	// 请求头
// 	post_option.headers = {
// 		'Content-Type': 'application/x-www-form-urlencoded',
// 		'AppKey': appKey,
// 		'Nonce': nonce,
// 		'CurTime': curTime,
// 		'CheckSum': checkSum,
// 	};
// 	let post_req = https.request(post_option, (response) => {
// 		response.setEncoding("utf8");
// 		response.on('data', function (buffer) {
// 			callback(null, buffer);
// 		});
// 	});
// 	post_req.write(post_data);
// 	post_req.end();
//
// };

/**
 * 网易云信IM即时通讯 自定义系统通知 批量点对点
 */
exports.IMBatchSystemNotice = (fromAccid, toAccids, attach, callback) => {
    let appKey = 'a75f33782cc86bb776d97d5ae2d7a2f8';
    let appSecret = '5563b18243de';
    let regUrl = "https://api.netease.im/nimserver/msg/sendBatchAttachMsg.action";
    let post_option = url.parse(regUrl);
    post_option.method = 'POST';
    let post_data = querystring.stringify({
        'fromAccid': fromAccid,
        'toAccids': toAccids,
        'attach': attach
    });
    // 对参数进行一系列操作
    let curTime = (Math.round((Date.now() / 1000)) - 60).toString(); // 获取时间戳 单位为秒。
    let nonce = utils.randomString(32); // 获取随机数。
    let str = appSecret + "" + nonce + "" + curTime;
    let checkSum = crypto.createHash('sha1').update(str).digest('hex');
    // 请求头
    post_option.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'AppKey': appKey,
        'Nonce': nonce,
        'CurTime': curTime,
        'CheckSum': checkSum,
    };
    let post_req = https.request(post_option, (response) => {
        response.setEncoding("utf8");
        response.on('data', function (buffer) {
            callback(null, buffer);
        });
    });
    post_req.write(post_data);
    post_req.end();

};

//
exports.findR = (id) => {
    Classify.find({_id: id}, function (err, R) {
        if (err)throw err;
        if (!R) return;
        return R;
    })
};


