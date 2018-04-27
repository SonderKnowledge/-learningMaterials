classes = [
  'Person'
  'Landlords'
  'Tenants'
  'Todos'
  'Notices'
  'Houses'
  'Rooms'
  'Beds'
  'Rents'
  'Orders'
]

all = classes.reduce (r, c) =>
  {
    r...
    "#{c}"
  }
, {}

console.log all