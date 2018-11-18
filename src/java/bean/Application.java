/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author TFT
 */
public class Application {

    /**
     * @return the applicant
     */
    public String getApplicant() {
        return applicant;
    }

    /**
     * @return the approval
     */
    public String getApproval() {
        return approval;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @return the room
     */
    public String getRoom() {
        return room;
    }

    /**
     * @param applicant the applicant to set
     */
    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    /**
     * @param approval the approval to set
     */
    public void setApproval(String approval) {
        this.approval = approval;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @param room the room to set
     */
    public void setRoom(String room) {
        this.room = room;
    }

    private String id;
    private String applicant;
    private String approval;
    private String room;
}
