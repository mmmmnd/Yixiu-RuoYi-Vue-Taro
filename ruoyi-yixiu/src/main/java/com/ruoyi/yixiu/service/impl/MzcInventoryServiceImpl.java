package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcInventoryMapper;
import com.ruoyi.yixiu.domain.MzcInventory;
import com.ruoyi.yixiu.service.IMzcInventoryService;

/**
 * 配件清单Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Service
public class MzcInventoryServiceImpl implements IMzcInventoryService
{
    @Autowired
    private MzcInventoryMapper mzcInventoryMapper;

    /**
     * 查询配件清单
     *
     * @param inventoryId 配件清单主键
     * @return 配件清单
     */
    @Override
    public MzcInventory selectMzcInventoryByInventoryId(Long inventoryId)
    {
        return mzcInventoryMapper.selectMzcInventoryByInventoryId(inventoryId);
    }

    /**
     * 查询配件清单列表
     *
     * @param mzcInventory 配件清单
     * @return 配件清单
     */
    @Override
    public List<MzcInventory> selectMzcInventoryList(MzcInventory mzcInventory)
    {
        return mzcInventoryMapper.selectMzcInventoryList(mzcInventory);
    }

    /**
     * 新增配件清单
     *
     * @param mzcInventory 配件清单
     * @return 结果
     */
    @Override
    public int insertMzcInventory(MzcInventory mzcInventory)
    {
        mzcInventory.setCreateTime(DateUtils.getNowDate());
        mzcInventory.setCreateBy(getUsername());
        return mzcInventoryMapper.insertMzcInventory(mzcInventory);
    }

    /**
     * 修改配件清单
     *
     * @param mzcInventory 配件清单
     * @return 结果
     */
    @Override
    public int updateMzcInventory(MzcInventory mzcInventory)
    {
        mzcInventory.setUpdateTime(DateUtils.getNowDate());
        mzcInventory.setUpdateBy(getUsername());
        return mzcInventoryMapper.updateMzcInventory(mzcInventory);
    }

    /**
     * 批量删除配件清单
     *
     * @param inventoryIds 需要删除的配件清单主键
     * @return 结果
     */
    @Override
    public int deleteMzcInventoryByInventoryIds(Long[] inventoryIds)
    {
        String deleteByName = getUsername();
        return mzcInventoryMapper.deleteMzcInventoryByInventoryIds(inventoryIds,deleteByName);
    }

    /**
     * 删除配件清单信息
     *
     * @param inventoryId 配件清单主键
     * @return 结果
     */
    @Override
    public int deleteMzcInventoryByInventoryId(Long inventoryId)
    {
        String deleteByName = getUsername();
        return mzcInventoryMapper.deleteMzcInventoryByInventoryId(inventoryId,deleteByName);
    }
}
