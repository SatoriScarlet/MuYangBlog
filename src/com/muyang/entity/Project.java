package com.muyang.entity;

import java.util.List;

public class Project {


    private int projectId = 0;
    private String projectCode = "";
    private String projectName = "";
    private String projectLittleName = "";
    private String projectIntro = "";
    private int projectPlanValue = 0;

    private List<ProjectPlan> projectPlanList = null;

    public List<ProjectPlan> getProjectPlanList() {
        return projectPlanList;
    }

    public void setProjectPlanList(List<ProjectPlan> projectPlanList) {
        this.projectPlanList = projectPlanList;
    }

    public int getProjectPlanValue() {
        return projectPlanValue;
    }

    public void setProjectPlanValue(int projectPlanValue) {
        this.projectPlanValue = projectPlanValue;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectLittleName() {
        return projectLittleName;
    }

    public void setProjectLittleName(String projectLittleName) {
        this.projectLittleName = projectLittleName;
    }

    public String getProjectIntro() {
        return projectIntro;
    }

    public void setProjectIntro(String projectIntro) {
        this.projectIntro = projectIntro;
    }
}
