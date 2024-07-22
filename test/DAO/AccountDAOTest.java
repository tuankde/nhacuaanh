/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import enity.Account;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Acer
 */
public class AccountDAOTest {
    
    public AccountDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getAccountByUserAndPass method, of class AccountDAO.
     */
    @Test
    public void testGetAccountByUserAndPass() {
        System.out.println("getAccountByUserAndPass");
        String user = "";
        String password = "";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccountByUserAndPass(user, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateAccount method, of class AccountDAO.
     */
    @Test
    public void testUpdateAccount() {
        System.out.println("updateAccount");
        int userId = 0;
        String fullName = "";
        String email = "";
        String phone = "";
        String location = "";
        AccountDAO instance = new AccountDAO();
        instance.updateAccount(userId, fullName, email, phone, location);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllAccount method, of class AccountDAO.
     */
    @Test
    public void testGetAllAccount() {
        System.out.println("getAllAccount");
        AccountDAO instance = new AccountDAO();
        List<Account> expResult = null;
        List<Account> result = instance.getAllAccount();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkUserDupplicate method, of class AccountDAO.
     */
    @Test
    public void testCheckUserDupplicate() {
        System.out.println("checkUserDupplicate");
        String userName = "";
        AccountDAO instance = new AccountDAO();
        boolean expResult = false;
        boolean result = instance.checkUserDupplicate(userName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of UpdatePassAccount method, of class AccountDAO.
     */
    @Test
    public void testUpdatePassAccount() {
        System.out.println("UpdatePassAccount");
        Account acc = null;
        String newPass = "";
        AccountDAO instance = new AccountDAO();
        instance.UpdatePassAccount(acc, newPass);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertNewAccount method, of class AccountDAO.
     */
    @Test
    public void testInsertNewAccount() {
        System.out.println("insertNewAccount");
        String userName = "";
        String password = "";
        String name = "";
        String phone = "";
        String email = "";
        String location = "";
        int roleId = 0;
        AccountDAO instance = new AccountDAO();
        instance.insertNewAccount(userName, password, name, phone, email, location, roleId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAccountByEmail method, of class AccountDAO.
     */
    @Test
    public void testGetAccountByEmail() {
        System.out.println("getAccountByEmail");
        String email = "";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccountByEmail(email);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteAccountByID method, of class AccountDAO.
     */
    @Test
    public void testDeleteAccountByID() {
        System.out.println("deleteAccountByID");
        int userID = 0;
        AccountDAO instance = new AccountDAO();
        instance.deleteAccountByID(userID);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateAccountInEditManagement method, of class AccountDAO.
     */
    @Test
    public void testUpdateAccountInEditManagement() {
        System.out.println("updateAccountInEditManagement");
        int userID = 0;
        String password = "";
        String name = "";
        String phone = "";
        String location = "";
        AccountDAO instance = new AccountDAO();
        instance.updateAccountInEditManagement(userID, password, name, phone, location);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchAccountByUser method, of class AccountDAO.
     */
    @Test
    public void testSearchAccountByUser() {
        System.out.println("searchAccountByUser");
        String userFind = "";
        AccountDAO instance = new AccountDAO();
        List<Account> expResult = null;
        List<Account> result = instance.searchAccountByUser(userFind);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAccountByUserID method, of class AccountDAO.
     */
    @Test
    public void testGetAccountByUserID() {
        System.out.println("getAccountByUserID");
        int userID = 0;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccountByUserID(userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class AccountDAO.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        AccountDAO.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAccountByOrderDetailId method, of class AccountDAO.
     */
    @Test
    public void testGetAccountByOrderDetailId() {
        System.out.println("getAccountByOrderDetailId");
        int orderDetailId = 0;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccountByOrderDetailId(orderDetailId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
