'use strict';

module.exports = app => {
  app.get('/', function* () {
    this.body = `isIOS: ${this.isIOS}`;
  });

  app.get('/framework', function* () {
    this.body = this.app.config.framework.name;
  });
};
