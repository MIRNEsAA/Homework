*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PASSWORD}    MaharaDemo
${USERNAME1}    Admin
${USERNAME2}    Student
${USERNAME3}    Learner
${USERNAME4}    Staff
${USERNAME5}    Sitestaff
${INVALID_LOGIN_ERROR1}    You have not provided the correct credentials to log in. Please check your username and password are correct.
${INVALID_LOGIN_ERROR2}    There was an error with submitting this form. Please check the marked fields and try again.