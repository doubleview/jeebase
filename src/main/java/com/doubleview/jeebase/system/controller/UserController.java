package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.utils.FileUtils;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.service.UserService;
import com.doubleview.jeebase.system.utils.ShiroUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * 用户控制器
 */
@RequestMapping("${adminPath}/system/user")
@Controller
public class UserController extends BaseController{

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"list" , ""})
    public String list(User user , HttpServletRequest request , Model model){
        Page<User> page = userService.getPage(new Page<>(request) , user);
        model.addAttribute("page" , page);
        return "system/user";
    }

    @RequestMapping("edit")
    public String edit(String id , Model model){
        if(StringUtils.isNotBlank(id)){
            model.addAttribute("user" , userService.get(id));
        }else {
            model.addAttribute("user" , new User());
        }
        return "system/user_edit";
    }

    @RequestMapping("save")
    public String save(User user, RedirectAttributes model){
        userService.save(user);
        model.addFlashAttribute("message" , "保存用户'"+user.getName()+"'成功");
        return "redirect:" + adminPath + "/system/user";
    }

    @RequestMapping("del")
    @ResponseBody
    public ResponseResult del(String id){
        Validate.notBlank(id);
        try {
            userService.delete(new User(id));
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return fail(e.getMessage());
        }
        return  success("删除成功");
    }

    /**
     * 个人信息
     * @return
     */
    @RequestMapping("user-profile")
    public String profile(Model model) {
        model.addAttribute("user" , ShiroUtils.getCurrentUser());
        return "system/user_profile";
    }

    /**
     * 头像修改页面
     * @return
     */
    @RequestMapping("user-profile-photo")
    public String profilePhoto(Model model) {
        model.addAttribute("user" , ShiroUtils.getCurrentUser());
        return "system/user_profile_photo";
    }

    /**
     * 密码修改页面
     * @return
     */
    @RequestMapping("user-profile-pass")
    public String profilePassword(Model model) {
        model.addAttribute("user" , ShiroUtils.getCurrentUser());
        return "system/user_profile_pass";
    }

    /**
     * 保存个人账户信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("profile-save")
    public String profileSave(User user, Model model) {
        userService.profileSave(user);
        model.addAttribute("message" , "保存信息成功");
        return "system/user_profile";
    }

    /**
     * 个人密码修改
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("password-save")
    public String profilePasswordSave(User user, Model model) {
        String message = userService.profilePasswordSave(user);
        message = StringUtils.isNotBlank(message) ? message : "更改密码成功";
        model.addAttribute("message", message);
        return "system/user_profile_pass";
    }

    /**
     * 用户头像上传
     * @param request
     * @return
     */
    @RequestMapping("photo-save")
    public String profilePhotoSave(User user , @RequestParam("userImg") MultipartFile userImg,
                                   HttpServletRequest request , Model model) throws Exception {
        String newName = FileUtils.rename( userImg.getOriginalFilename());
        File file = new File(request.getSession().getServletContext().getRealPath("/") + FileUtils.UPLOAD_DIR);
        if (!file.exists()) {
            file.mkdirs();
        }
        userImg.transferTo(new File(file , newName));
        user.setPhoto(FileUtils.UPLOAD_DIR  + newName);
        model.addAttribute("message" , "更改用户头像成功");
        userService.updatePhoto(user);
        return "system/user_profile_photo";
    }
}
