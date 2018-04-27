import LOGINSAGAS from './login'
import USERSAGAS from './user'
import LANDLORDSAGAS from './landlord'
import TENANTSAGAS from './tenant'
import TODOSAGAS from './todo'
import NOTICESAGAS from './notice'
# import houseSagas from './house'
# import roomSagas from './room'
# import bedSagas from './bed'
# import rentSagas from './rent'

export default ({
  urlConf
}) => [
  LOGINSAGAS
  USERSAGAS
  LANDLORDSAGAS
  TENANTSAGAS
  TODOSAGAS
  NOTICESAGAS
  # houseSagas
  # roomSagas
  # bedSagas
  # rentSagas
].reduce (r, c) =>
  [
    r...
    (
      c {
        urlConf
      }
    )...
  ]
, []
