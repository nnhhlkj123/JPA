package vn.iostar.service.imp;

import java.util.List;
import vn.iostar.dao.IVideoDao;
import vn.iostar.dao.imp.VideoDao;
import vn.iostar.entity.Video;
import vn.iostar.service.IVideoService;

public class VideoServiceImp implements IVideoService {
	private IVideoDao videoDao = new VideoDao();

	@Override
	public List<Video> findAll() {
		return videoDao.findAll();
	}

	@Override
	public Video findById(String id) {
		return videoDao.findById(id);
	}

	@Override
	public List<Video> searchByTitle(String keyword) {
		return videoDao.searchByTitle(keyword);
	}

	@Override
	public void insert(Video video) {
		videoDao.insert(video);
	}

	@Override
	public void update(Video video) {
		videoDao.update(video);
	}

	@Override
	public void delete(String id) {
		try {
			videoDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int count() {
		return videoDao.count();
	}

	@Override
	public List<Video> findAll(int page, int pageSize) {
		return videoDao.findAll(page, pageSize);
	}
}
