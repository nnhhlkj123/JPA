package vn.iostar.dao;

import java.util.List;
import vn.iostar.entity.Video;

public interface IVideoDao {
	void insert(Video video);

	int count();

	List<Video> findAll(int page, int pageSize);

	List<Video> findAll();

	Video findById(String videoId);

	void delete(String videoId) throws Exception;

	void update(Video video);

	List<Video> searchByTitle(String title);
}
