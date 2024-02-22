package com.huanNguyen.shopClothes.controller;

import com.huanNguyen.shopClothes.entity.Role;
import com.huanNguyen.shopClothes.entity.Staff;
import com.huanNguyen.shopClothes.services.impl.RoleServiceImpl;
import com.huanNguyen.shopClothes.services.impl.StaffServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Controller
//@RequestMapping("/shopClothes")
public class LoginController {
    @Autowired
    private StaffServiceImpl staffService;
    @Autowired
    private RoleServiceImpl roleService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerGet() {
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(@RequestParam String email, @RequestParam String password,
                               @RequestParam String passwordRepeat, @RequestParam String fullname,
                               @RequestParam String username, ModelMap model) {
        boolean checkMail = validate(email);
        if (checkMail) {
            if (password.equals(passwordRepeat)) {
                Staff staff = new Staff();
                staff.setEmail(email);
                staff.setPassword(password);
                staff.setName(fullname);
                staff.setUsername(username);
                Role role = roleService.getRoleById(1);
                staff.setRoleId(role);
                boolean checkAdd = staffService.addStaff(staff);
                if (checkAdd) {
                    System.out.println("success");
                    model.addAttribute("loginCheck", "Success!");
                } else {
                    System.out.println("Failed at checkAdd");
                    model.addAttribute("loginCheck", "Email or password is not valid!");
                    return "register";
                }
            } else {
                System.out.println("Failed at sample password");
                model.addAttribute("loginCheck", "Email or password is not valid!");
                return "register";
            }
        } else {
            System.out.println("Failed at email");
            model.addAttribute("loginCheck", "Email or password is not valid!");
            return "register";
        }
        return "login";
    }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.matches();
    }
}
