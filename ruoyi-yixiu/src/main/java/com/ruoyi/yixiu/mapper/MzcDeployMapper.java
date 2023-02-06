package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcDeploy;
import org.apache.ibatis.annotations.Param;

/**
 * 借配Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface MzcDeployMapper
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
     * 删除借配
     *
     * @param deployId 借配主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcDeployByDeployId(@Param("deployId") Long deployId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除借配
     *
     * @param deployIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcDeployByDeployIds(@Param("deployIds") Long[] deployIds, @Param("deleteByName") String deleteByName);
}
