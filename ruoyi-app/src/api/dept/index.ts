import Https from '@/utils/http/https';
const https = new Https();

/* 查询指定祖级列表长度的列表 */
export function deptAncestorsList(params): Promise<Service.BackendResultObjectConfig> {
  return https.get('/system/dept/getAncestorsList', params);
}

/* 查询父部门id下的列表 */
export function deptParentIdList(params): Promise<Service.BackendResultObjectConfig> {
  return https.get('/system/dept/getParentIdList', params);
}
