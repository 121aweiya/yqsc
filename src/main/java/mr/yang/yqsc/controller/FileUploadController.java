package mr.yang.yqsc.controller;


import mr.yang.yqsc.service.YueqiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class FileUploadController {


    @Autowired
    private YueqiService yueqiService;


    @RequestMapping("/upload")
    @ResponseBody
    public Map<String, Object> upload(HttpServletRequest request, MultipartFile upload) throws IOException {
        System.out.println("springmvc文件上传...");


        // 上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        // 判断，该路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            // 创建该文件夹
            file.mkdirs();
        }

        // 获取上传文件的名称
        String filename = upload.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;
        // 完成文件上传
        upload.transferTo(new File(path, filename));
        Map<String, Object> map = new HashMap<>();

        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + request.getContextPath();

        String absPath = basePath + "/uploads/" + filename;
        List<String> d = new ArrayList<>();
        d.add(absPath);
        map.put("errno", 0);
        map.put("data", d);


        return map;

    }


    @RequestMapping("/upload1")
    @ResponseBody
    public String upload1(HttpServletRequest request, Integer id, MultipartFile upload) throws IOException {
        System.out.println("springmvc文件上传2...");


        // 上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        // 判断，该路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            // 创建该文件夹
            file.mkdirs();
        }

        // 获取上传文件的名称
        String filename = upload.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;
        // 完成文件上传
        upload.transferTo(new File(path, filename));
        Map<String, Object> map = new HashMap<>();

        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + request.getContextPath();

        String absPath = basePath + "/uploads/" + filename;

        //写入数据
        boolean b = yueqiService.updateImgUrlById(id, absPath);


        System.out.println(id);


        return b ? "ok" : "failed";
    }

}
