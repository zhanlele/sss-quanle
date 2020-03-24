package com.quanle.service.impl;

import com.quanle.dao.ResumeDao;
import com.quanle.entirypojo.Resume;
import com.quanle.service.ResumeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * @author quanle
 * @date 2020/3/24 12:55 AM
 */
@Service
public class ResumeServiceImpl implements ResumeService {
    @Autowired
    private ResumeDao resumeDao;

    @Override
    public Page<Resume> findByPage(Integer pageNo, Integer pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return resumeDao.findAll(pageable);
    }

    @Override
    public Resume getById(Integer id) {
        return resumeDao.findById(id).orElse(new Resume());
    }

    @Override
    public void update(Resume resume) {
        resumeDao.save(resume);
    }

    @Override
    public void insert(Resume resume) {
        resumeDao.save(resume);
    }

    @Override
    public void delete(Integer id) {
        resumeDao.deleteById(id);
    }
}
