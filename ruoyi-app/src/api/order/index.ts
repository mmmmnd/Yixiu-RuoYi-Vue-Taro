import { Order, User, Menu } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**我的信息 */
export function addOrder(params): Promise<Service.BackendResultConfig<User.IMyInfo>> {
  return https.post('/yixiu/order', params);
}
