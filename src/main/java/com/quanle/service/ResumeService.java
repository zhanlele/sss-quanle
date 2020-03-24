package com.quanle.service;

import com.quanle.entirypojo.Resume;

import org.springframework.data.domain.Page;

/**
 * @author quanle
 * @date 2020/3/24 12:55 AM
 */
public interface ResumeService {
    Page<Resume> findByPage(Integer pageNo, Integer pageSize);

    Resume getById(Integer id);

    void update(Resume resume);

    void insert(Resume resume);

    void delete(Integer id);
}
