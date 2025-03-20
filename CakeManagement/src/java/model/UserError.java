/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hoadoan
 */
public class UserError {
    private String userIDError;
    private String fullNameDError;
    private String roleIDDError;
    private String passwordDError;
    private String confirm;
    private String error;

    public UserError() {
        this.userIDError = "";
        this.fullNameDError = "";
        this.roleIDDError = "";
        this.passwordDError = "";
        this.confirm = "";
        this.error = "";
    }

    public UserError(String userIDError, String fullNameDError, String roleIDDError, String passwordDError, String confirm, String error) {
        this.userIDError = userIDError;
        this.fullNameDError = fullNameDError;
        this.roleIDDError = roleIDDError;
        this.passwordDError = passwordDError;
        this.confirm = confirm;
        this.error = error;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameDError() {
        return fullNameDError;
    }

    public void setFullNameDError(String fullNameDError) {
        this.fullNameDError = fullNameDError;
    }

    public String getRoleIDDError() {
        return roleIDDError;
    }

    public void setRoleIDDError(String roleIDDError) {
        this.roleIDDError = roleIDDError;
    }

    public String getPasswordDError() {
        return passwordDError;
    }

    public void setPasswordDError(String passwordDError) {
        this.passwordDError = passwordDError;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
