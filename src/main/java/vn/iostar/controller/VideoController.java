package vn.iostar.controller;

import java.io.*;
import java.nio.file.*;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iostar.entity.Category;
import vn.iostar.entity.Video;
import vn.iostar.service.ICategoryService;
import vn.iostar.service.IVideoService;
import vn.iostar.service.imp.CategoryServiceImp;
import vn.iostar.service.imp.VideoServiceImp;
import vn.iostar.utils.Constant;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/videos", "/admin/video/add", "/admin/video/insert", "/admin/video/edit",
		"/admin/video/update", "/admin/video/delete" })
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public IVideoService videoService = new VideoServiceImp();
	public ICategoryService cateService = new CategoryServiceImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		String keyword = req.getParameter("keyword");
		if (url.contains("/admin/videos")) {
			if (keyword != null && !keyword.isEmpty()) {
		        List<Video> list = videoService.searchByTitle(keyword); // Gọi phương thức tìm kiếm
		        req.setAttribute("listvideo", list);
		    } else {
		        List<Category> categories = cateService.findAll(); // Lấy danh sách danh mục
		        req.setAttribute("listCategories", categories); // Đặt danh sách danh mục vào request
		        List<Video> list = videoService.findAll(); // Lấy danh sách video
		        req.setAttribute("listvideo", list); // Đặt danh sách video vào request
		    }
		    
		    // Chuyển đến trang video-list.jsp
		    req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);


		} else if (url.contains("/admin/video/add")) {
			req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);

		} else if (url.contains("/admin/video/edit")) {
			String videoId = req.getParameter("id");
			Video video = videoService.findById(videoId);
			req.setAttribute("video", video);
			req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);

		} else {
			String videoId = req.getParameter("id");
			try {
				videoService.delete(videoId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();

		if (url.contains("/admin/video/insert")) {
			// lấy dữ liệu từ form
			String videoId = req.getParameter("videoId");
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			boolean active = Boolean.parseBoolean(req.getParameter("active"));
			String fname = "";

			// đưa dữ liệu vào model
			Video video = new Video();
			video.setVideoId(videoId);
			video.setTitle(title);
			video.setDescription(description);
			video.setActive(active);

			String uploadPath = Constant.UPLOAD_DIRECTORY; // upload vào thư mục bất kỳ
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				Part part = req.getPart("poster");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					video.setPoster(fname);
				} else {
					video.setPoster("default.png"); // hoặc giữ nguyên ảnh cũ nếu cần
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			// đưa model vào phương thức insert
			videoService.insert(video);

			// chuyển trang
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		}

		if (url.contains("/admin/video/update")) {
			// lấy dữ liệu từ form
			String videoId = req.getParameter("videoId");
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			boolean active = Boolean.parseBoolean(req.getParameter("active"));

			// tìm video theo id
			Video video = videoService.findById(videoId);
			video.setTitle(title);
			video.setDescription(description);
			video.setActive(active);
			String fileOld = video.getPoster();
			String fname = "";

			String uploadPath = Constant.UPLOAD_DIRECTORY; // upload vào thư mục bất kỳ
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				Part part = req.getPart("poster");
				if (part.getSize() > 0) {
					// xóa file cũ trên thư mục nếu không phải là ảnh mặc định
					if (!fileOld.equals("default.png")) {
						deleteFile(uploadPath + "/" + fileOld);
					}

					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					video.setPoster(fname);
				} else {
					video.setPoster(fileOld);
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			// cập nhật video
			videoService.update(video);

			// chuyển trang
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		}
	}

	public static void deleteFile(String filePath) throws IOException {
		Path path = Paths.get(filePath);
		Files.delete(path);
	}
}
