/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-16 14:58:38
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 10:34:07
 */
import { Product, Order, Engineer, Work, Accessories } from '@/interfaces/';
/**医院 */
export namespace Hospital {
  /** 医院部门信息 */
  export interface IInfo
    extends iDepartment,
      Product.IRepair,
      Order.IRepair,
      Order.IQuotation,
      Product.IInfo,
      Engineer.IInfo,
      Product.IProductMaintenanceTime,
      Order.IInfo,
      Work.IType,
      Product.IEquipmentReason,
      Hospital.IEmployee,
      Order.IAcceptance<Accessories.ITltle> {
    model_number: string;
    /** 申请科室 */
    dean_branch_opinion: string;
    /** 装备部 */
    department_opinion: string;
    /** 分管院长 */
    equip_opinion: string;
    /** 院长 */
    dean_opinion: string;
    /**医院地址 */
    company_address: string;
    /**医院名称 */
    company_name: string;
    /**医院id */
    company_id: number;
  }
  /**验收*/
  export interface iDepartment {
    /**科室*/
    accept_department_name: string;
    /**科室id*/
    department_id: number;
    /**科室*/
    department_name: string;
    /**单位 */
    accept_company_name: string;
  }

  /**员工 */
  export interface IEmployee extends iDepartment {
    /**姓名 */
    accepter_name: string;
  }

  /**科室主管 */
  export interface IDirector {
    /**科室主管审批意见 */
    department_opinion: string;
    /**审批时间 */
    department_check_time;
  }
}
