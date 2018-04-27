# # 根据测试人员更换不同的 X-LC-Id、X-LC-Key和 className
# export default config = do =>
#   header = do =>
#     base =
#       'Content-Type': 'application/json'
#       'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
#       'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
#     {
#       base
#     }
#     master = 
#       {
#         base...
#         'X-LC-Key': 'eQYsxL68rSQLFyxiPtgxN4wW,master'
#       }
  
#   baseUri = "https://xy1g1vfw.api.lncld.net/1.1"
  
#   className: [
#     # 系统自带的七个Class
#     '_Conversation'
#     '_File'
#     '_Followee'
#     '_Follower'
#     '_Installation'
#     '_Role'
#     '_User'
#     # 自己创建的Class
#     'Landlords'
#     'Notices'
#     'Person'
#     'Post'
#     'Tenants'
#     'Todos' 
#   ]
  



export default config = 
  baseUri: "https://xy1g1vfw.api.lncld.net/1.1"

  base_header:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  
  master_header:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'eQYsxL68rSQLFyxiPtgxN4wW,master'

  className: [
    # 系统自带的七个Class
    '_Conversation'
    '_File'
    '_Followee'
    '_Follower'
    '_Installation'
    '_Role'
    '_User'
    # 自己创建的Class
    'Landlords'
    'Notices'
    'Person'
    'Post'
    'Tenants'
    'Todos'
  ]
