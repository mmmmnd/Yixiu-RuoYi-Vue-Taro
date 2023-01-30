/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 15:38:28
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 15:43:22
 */
/** 产品信息 */
export namespace Product {
  /** 产品明细 */
  export interface IInfo {
    // 产品id
    facility_id: string;
    // 产品名称
    facility_name: string;
    // 产品型号
    facility_model: string;
    // 出厂编号
    factory_number: string;
    // 序列号
    serial_number: string;
  }
  /**产品维修 */
  export interface IRepair extends IInfo {
    //报修人
    creater: string;
    //联系电话
    creater_phone: string;
    //上门时间
    expect_time: string;
    //工作类型id
    type_id: string;
    //工作类型
    type_name: string;
    //故障描述
    failure_describe: string;
  }

  /**产品时间 */
  export interface IDate {
    handle_start_time: Date | string | number;
    finish_time: Date | string | number;
  }

  /**产品维修时间 */
  export interface IProductMaintenanceTime {
    /**开始时间 */
    repair_time: Date | string | number;
    /**结束时间 */
    finish_time: Date | string | number;
  }

  /**维护 */
  export interface IMaintain {
    /**维修持续时间 */
    spend_period: Date | string | number;
    /**保修期 */
    warranty_period: Date | string | number;
  }

  /**设备原因 */
  export interface IEquipmentReason {
    /**故障现象 */
    failure_describe: string;
    /**故障原因 */
    failure_cause: string;
    /**检测结果|维修结果 */
    repair_result: string;
  }
}
