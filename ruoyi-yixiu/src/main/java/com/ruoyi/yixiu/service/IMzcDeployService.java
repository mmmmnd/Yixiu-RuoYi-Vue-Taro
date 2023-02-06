package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcDeploy;

/**
 * 借配Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface IMzcDeployService 
{
    /**
     * 查询借配
     * 
     * @param deployId 借配主键
     * @return 借配
     */
    public MzcDeploy selectMzcDeployByDeployId(Long deployId);

    /**
     * 查询借配列表
     * 
     * @param mzcDeploy 借配
     * @return 借配集合
     */
    public List<MzcDeploy> selectMzcDeployList(MzcDeploy mzcDeploy);

    /**
     * 新增借配
     * 
     * @param mzcDeploy 借配
     * @return 结果
     */
    public int insertMzcDeploy(MzcDeploy mzcDeploy);

    /**
     * 修改借配
     * 
     * @param mzcDeploy 借配
     * @return 结果
     */
    public int updateMzcDeploy(MzcDeploy mzcDeploy);

    /**
     * 批量删除借配
     * 
     * @param deployIds 需要删除的借配主键集合
     * @return 结果
     */
    public int deleteMzcDeployByDeployIds(Long[] deployIds);

    /**
     * 删除借配信息
     * 
     * @param deployId 借配主键
     * @return 结果
     */
    public int deleteMzcDeployByDeployId(Long deployId);
}
