package com.poly.lab4.DAO;

import com.poly.lab4.entity.Video;

import java.util.List;

public interface VideoDAO {
    List<Video> findByKeyword(String keyword);
    List<Object[]> reportShare();
}

