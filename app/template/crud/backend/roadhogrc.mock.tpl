/**
 * template config
 * @param filename .roadhogrc.mock.js
 * @param copy 1
 */
import mockjs from 'mockjs';
import { getRule, postRule } from './mock/rule';
import { getActivities, getNotice, getFakeList } from './mock/api';
import { getFakeChartData } from './mock/chart';
import { getProfileBasicData } from './mock/profile';
import { getProfileAdvancedData } from './mock/profile';
import { getNotices } from './mock/notices';
import { format, delay } from 'roadhog-api-doc';

// 是否禁用代理
const noProxy = process.env.NO_PROXY === 'true';
/******************  拷贝以下内容  ******************/
// 服务器地址
const serverUrl = 'http://localhost:7001';
/******************  拷贝完毕  ******************/
// 代码中会兼容本地 service mock 以及部署站点的静态数据
const proxy = {

  /******************  拷贝以下内容  ******************/

  'GET /api/v1/<%= identity | pluralize %>': serverUrl, // list <%= identity %>
  'POST /api/v1/<%= identity | pluralize %>': serverUrl, // add <%= identity %>
  'PUT /api/v1/<%= identity | pluralize %>/*': serverUrl, // update <%= identity %>
  'DELETE /api/v1/<%= identity | pluralize %>/*': serverUrl, // remove <%= identity %>

  /******************  拷贝完毕  ******************/
};

export default (noProxy ? {} : delay(proxy, 1000));
