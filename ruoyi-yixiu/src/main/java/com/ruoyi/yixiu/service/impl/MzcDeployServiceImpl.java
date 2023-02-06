package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcDeployMapper;
import com.ruoyi.yixiu.domain.MzcDeploy;
import com.ruoyi.yixiu.service.IMzcDeployService;

/**
 * 借配Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Service
public class MzcDeployServiceImpl implements IMzcDeployService
{
    @Autowired
    private MzcDeployMapper mzcDeployMapper;

    /**
     * 查询借配
     *
     * @param deployId 借配主键
     * @return 借配
     */
    @Override
    public MzcDeploy selectMzcDeployByDeployId(Long deployId)
    {
        return mzcDeployMapper.selectMzcDeployByDeployId(deployId);
    }

    /**
     * 查询借配列表
     *
     * @param mzcDeploy 借配
     * @return 借配
     */
    @Override
    public List<MzcDeploy> selectMzcDeployList(MzcDeploy mzcDeploy)
    {
        return mzcDeployMapper.selectMzcDeployList(mzcDeploy);
    }

    /**
     * 新增借配
     *
     * @param mzcDeploy 借配
     * @return 结果
     */
    @Override
    public int insertMzcDeploy(MzcDeploy mzcDeploy)
    {
        mzcDeploy.setCreateTime(DateUtils.getNowDate());
        mzcDeploy.setCreateBy(getUsername());
        return mzcDeployMapper.insertMzcDeploy(mzcDeploy);
    }

    /**
     * 修改借配
     *
     * @param mzcDeploy 借配
     * @return 结果
     */
    @Override
    public int updateMzcDeploy(MzcDeploy mzcDeploy)
    {
        mzcDeploy.setUpdateTime(DateUtils.getNowDate());
        mzcDeploy.setUpdateBy(getUsername());
        return mzcDeployMapper.updateMzcDeploy(mzcDeploy);
    }

    /**
     * 批量删除借配
     *
     * @param deployIds 需要删除的借配主键
     * @return 结果
     */
    @Override
    public int deleteMzcDeployByDeployIds(Long[] deployIds)
    {
        String deleteByName = getUsername();
        return mzcDeployMapper.deleteMzcDeployByDeployIds(deployIds,deleteByName);
    }

    /**
     * 删除借配信息
     *
     * @param deployId 借配主键
     * @return 结果
     */
    @Override
    public int deleteMzcDeployByDeployId(Long deployId)
    {
        String deleteByName = getUsername();
        return mzcDeployMapper.deleteMzcDeployByDeployId(deployId,deleteByName);
    }
}
