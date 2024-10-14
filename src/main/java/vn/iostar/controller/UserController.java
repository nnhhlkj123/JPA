package vn.iostar.controller;

import java.io.*;
import java.nio.file.*;
import java.util.List;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iostar.entity.User;
import vn.iostar.service.IUserService;
import vn.iostar.service.imp.UserServiceImp;
import vn.iostar.utils.Constant;

@MultipartConfig()
@WebServlet(urlPatterns = { "/admin/users", "/admin/user/add", "/admin/user/insert", "/admin/user/edit",
		"/admin/user/update", "/admin/user/delete" })
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public IUserService userService = new UserServiceImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();

		if (url.contains("/admin/users")) {
			List<User> list = userService.findAll();
			req.setAttribute("listuser", list);
			req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);

		} else if (url.contains("/admin/user/add")) {
			req.getRequestDispatcher("/views/admin/user-add.jsp").forward(req, resp);

		} else if (url.contains("/admin/user/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			User user = userService.findById(id);
			req.setAttribute("user", user);
			req.getRequestDispatcher("/views/admin/user-edit.jsp").forward(req, resp);

		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			try {
				userService.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();

		if (url.contains("/admin/user/insert")) {
			String email = req.getParameter("email");
			String userName = req.getParameter("userName");
			String fullName = req.getParameter("fullName");
			String passWord = req.getParameter("passWord");
			int roleid = Integer.parseInt(req.getParameter("roleid"));
			String phone = req.getParameter("phone");
			Date createdDate = new Date();
			String avatar = req.getParameter("avatar");

			User user = new User();
			user.setEmail(email);
			user.setUserName(userName);
			user.setFullName(fullName);
			user.setPassWord(passWord);
			user.setRoleid(roleid);
			user.setPhone(phone);
			user.setCreatedDate(createdDate);

			String fname = "";
			String uploadPath = Constant.UPLOAD_DIRECTORY;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdir();

			try {
				Part part = req.getPart("avatarFile");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					user.setAvatar(fname);
				} else if (avatar != null) {
					user.setAvatar(avatar);
				} else {
					user.setAvatar("default-avatar.png");
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			userService.insert(user);
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		}

		if (url.contains("/admin/user/update")) {
			int id = Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");
			String userName = req.getParameter("userName");
			String fullName = req.getParameter("fullName");
			String passWord = req.getParameter("passWord");
			int roleid = Integer.parseInt(req.getParameter("roleid"));
			String phone = req.getParameter("phone");
			String avatar = req.getParameter("avatar");

			User user = userService.findById(id);
			String oldAvatar = user.getAvatar();
			user.setEmail(email);
			user.setUserName(userName);
			user.setFullName(fullName);
			user.setPassWord(passWord);
			user.setRoleid(roleid);
			user.setPhone(phone);

			String fname = "";
			String uploadPath = Constant.UPLOAD_DIRECTORY;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdir();

			try {
				Part part = req.getPart("avatarFile");
				if (part.getSize() > 0) {
					if (!user.getAvatar().substring(0, 5).equals("https")) {
						deleteFile(uploadPath + "\\" + oldAvatar);
					}
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					user.setAvatar(fname);
				} else if (avatar != null) {
					user.setAvatar(avatar);
				} else {
					user.setAvatar(oldAvatar);
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			userService.update(user);
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		}
	}

	public static void deleteFile(String filePath) throws IOException {
		Path path = Paths.get(filePath);
		Files.delete(path);
	}
}
