package com.quanle.controller;

import com.quanle.pojo.PageParam;
import com.quanle.pojo.PageResult;
import com.quanle.pojo.Result;
import com.quanle.entirypojo.Resume;
import com.quanle.service.ResumeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author quanle
 * @date 2020/3/24 12:54 AM
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {
    @Autowired
    private ResumeService resumeService;

    /**
     * 跳转简历首页
     *
     * @return
     */
    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String list() {
        return "resume_list";
    }

    /**
     * 查询简历列表
     *
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public PageResult<Resume> getList(PageParam pageParam) {
        Page<Resume> page = resumeService.findByPage(pageParam.getPageNo(), pageParam.getPageSize());
        PageResult<Resume> pageResult = new PageResult<>();
        pageResult.setTotal(page.getTotalElements());
        pageResult.setRows(page.getContent());
        pageResult.setPageSize(page.getPageable().getPageSize());
        pageResult.setTotalPage(page.getTotalPages());
        pageResult.setPage(page.getPageable().getPageNumber());
        return pageResult;
    }

    /**
     * 跳转简历新建页面
     *
     * @return
     */
    @RequestMapping(value = "/create" , method = RequestMethod.GET)
    public String createPage() {
        return "resume_create";
    }

    /**
     * 新建简历
     *
     * @param resume
     * @return
     */
    @RequestMapping(value = "/create" , method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> create(Resume resume) {
        resumeService.insert(resume);
        return Result.success();
    }

    /**
     * 跳转简历修改页面
     *
     * @param id    简历id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
    public String editPage(@PathVariable("id") Integer id, Model model) {
        Resume resume = resumeService.getById(id);
        model.addAttribute("resume" , resume);
        return "resume_edit";
    }

    /**
     * 修改简历
     *
     * @param resume
     * @return
     */
    @RequestMapping(value = "/edit" , method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Resume resume) {
        resumeService.update(resume);
        return Result.success();
    }

    /**
     * 删除简历
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}" , method = RequestMethod.GET)
    @ResponseBody
    public Result<Boolean> delete(@PathVariable("id") Integer id) {
        resumeService.delete(id);
        return Result.success();
    }
}
