/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import cons.SCons;
import dao.FileDao;
import dao.TeacherDao;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modls.Teacher;
import modls.UFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 *
 * @author tulga
 */
@Controller
public class TeacherFileController {

    FileDao fileDao;
    TeacherDao teacherDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setFileDao(FileDao fileDao) {
        this.fileDao = fileDao;
    }

    @RequestMapping(value = "/teacher/files.htm", method = RequestMethod.GET)
    public void showFiles(
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);
    }

    @RequestMapping(value = "/teacher/files.htm", method = RequestMethod.POST)
    public String uploadFile(
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);

        String name = request.getParameter("name");
        String fileType = request.getParameter("fileType");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("file");
        String extension = file.getOriginalFilename().substring(
                file.getOriginalFilename().lastIndexOf(".")).toLowerCase();
        String fileCode = generateRandomCode(20);
        String fileName = fileCode + extension;
        File destination = new File(SCons.filePath + fileName);
        UFile ufile = new UFile();

        ufile.setName(name);
        ufile.setFileName(file.getOriginalFilename());
        ufile.setUrl(fileName);
        ufile.setFileType(fileType);

        try {
            file.transferTo(destination);
        } catch (IOException ex) {
            Logger.getLogger(TeacherFileController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalStateException ex) {
            Logger.getLogger(TeacherFileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        fileDao.saveFile(ufile);
        t.getFiles().add(ufile);
        return "redirect:files.htm";
    }

    @RequestMapping(value = "/teacher/dfile.htm", method = RequestMethod.GET)
    public String deleteFile(
            @RequestParam(value = "fId") Long fId,
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);
        UFile uf = fileDao.getFile(fId);
        for(UFile f:t.getFiles()) {
            if(f.equals(uf)) {
                t.getFiles().remove(f);
            }
        }

//        t.getFiles().remove(uf);
//        fileDao
        return "redirect:files.htm";
    }

    @RequestMapping(value = "/getfile.htm")
    public void getFile(
            @RequestParam("f") String url,
            HttpServletResponse response) {
        UFile uFile = fileDao.getFile(url);
        try {
            if (uFile != null) {
                File file = new File(SCons.filePath + uFile.getUrl());
                response.setContentType(new MimetypesFileTypeMap().getContentType(file));
                FileInputStream in = new FileInputStream(file);
                OutputStream out = response.getOutputStream();
                response.setHeader("Content-Disposition", "attachment; filename=" + (uFile.getFileName()));
                byte[] buf = new byte[1024];
                int count = 0;
                while ((count = in.read(buf)) >= 0) {
                    out.write(buf, 0, count);
                }
                in.close();
                out.close();
            }
        } catch (IOException iOException) {
        }
    }

    public static String generateRandomCode(int length) {
        Random rand = new Random();
        char[][] characters = {
            {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'},
            {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
        };
        String code = "";
        while (length-- > 0) {
            int line = rand.nextInt(2);
            int index = rand.nextInt(26);
            code += characters[line][index];
        }
        return code;
    }
}
