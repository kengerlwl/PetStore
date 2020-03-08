package repetstore.dao.implement;

import repetstore.dao.AccountDAO;
import repetstore.dao.DBUtil;
import repetstore.domain.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAOImpl implements AccountDAO {
    //对应insert这三个方法的sql语句
    private static final String INSERT_SIGNON = "INSERT INTO SIGNON (PASSWORD,USERNAME)\n" +
            "    VALUES (?,?)";
    private static final String INSERT_ACCOUNT = "INSERT INTO ACCOUNT\n" +
            "      (EMAIL, FIRSTNAME, LASTNAME, STATUS, ADDR1, ADDR2, CITY, STATE, ZIP, COUNTRY, PHONE, USERID)\n" +
            "    VALUES\n" +
            "      (?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String INSERT_PROFILE = "INSERT INTO PROFILE (LANGPREF, FAVCATEGORY, USERID,MYLISTOPT,BANNEROPT)\n" +
            "    VALUES (?,?,?,?,?)";

    //对应update这三个方法的sql语句
    private static final String UPDATE_SIGNON = "UPDATE SIGNON SET PASSWORD = ? \n" +
            "   WHERE USERNAME = ?";
    private static final String UPDATE_ACCOUNT = "UPDATE ACCOUNT SET\n" +
            "      EMAIL = ?,\n" +
            "      FIRSTNAME = ?,\n" +
            "      LASTNAME = ?,\n" +
            "      STATUS = ?,\n" +
            "      ADDR1 = ?,\n" +
            "      ADDR2 = ?,\n" +
            "      CITY = ?,\n" +
            "      STATE = ?,\n" +
            "      ZIP = ?,\n" +
            "      COUNTRY = ?,\n" +
            "      PHONE = ?\n" +
            "    WHERE USERID = ?";
    private static final String UPDATE_PROFILE = "UPDATE PROFILE SET\n" +
            "      LANGPREF = ?,\n" +
            "      FAVCATEGORY = ?,\n" +
            "      MYLISTOPT = ?,\n" +
            "      BANNEROPT = ?\n" +
            "    WHERE USERID = ?";

    private static final String getAccountByUsernameString = "SELECT" +
            "          SIGNON.USERNAME," +
            "          ACCOUNT.EMAIL," +
            "          ACCOUNT.FIRSTNAME," +
            "          ACCOUNT.LASTNAME," +
            "          ACCOUNT.STATUS," +
            "          ACCOUNT.ADDR1 AS address1," +
            "          ACCOUNT.ADDR2 AS address2," +
            "          ACCOUNT.CITY," +
            "          ACCOUNT.STATE," +
            "          ACCOUNT.ZIP," +
            "          ACCOUNT.COUNTRY," +
            "          ACCOUNT.PHONE," +
            "          PROFILE.LANGPREF AS languagePreference," +
            "          PROFILE.FAVCATEGORY AS favouriteCategoryId," +
            "          PROFILE.MYLISTOPT AS listOption," +
            "          PROFILE.BANNEROPT AS bannerOption," +
            "          BANNERDATA.BANNERNAME" +
            "    FROM ACCOUNT, PROFILE, SIGNON, BANNERDATA" +
            "    WHERE ACCOUNT.USERID = ?" +
            "      AND SIGNON.USERNAME = ACCOUNT.USERID" +
            "      AND PROFILE.USERID = ACCOUNT.USERID" +
            "      AND PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY";

    private static final String GET_CATEGORY_LIST = "SELECT\n" +
            "      SIGNON.USERNAME,\n" +
            "      ACCOUNT.EMAIL,\n" +
            "      ACCOUNT.FIRSTNAME,\n" +
            "      ACCOUNT.LASTNAME,\n" +
            "      ACCOUNT.STATUS,\n" +
            "      ACCOUNT.ADDR1 AS address1,\n" +
            "      ACCOUNT.ADDR2 AS address2,\n" +
            "      ACCOUNT.CITY,\n" +
            "      ACCOUNT.STATE,\n" +
            "      ACCOUNT.ZIP,\n" +
            "      ACCOUNT.COUNTRY,\n" +
            "      ACCOUNT.PHONE,\n" +
            "      PROFILE.LANGPREF AS languagePreference,\n" +
            "      PROFILE.FAVCATEGORY AS favouriteCategoryId,\n" +
            "      PROFILE.MYLISTOPT AS listOption,\n" +
            "      PROFILE.BANNEROPT AS bannerOption,\n" +
            "      BANNERDATA.BANNERNAME\n" +
            "    FROM ACCOUNT, PROFILE, SIGNON, BANNERDATA\n" +
            "    WHERE ACCOUNT.USERID = ?\n" +
            "      AND SIGNON.PASSWORD = ?\n" +
            "      AND SIGNON.USERNAME = ACCOUNT.USERID\n" +
            "      AND PROFILE.USERID = ACCOUNT.USERID\n" +
            "      AND PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY";

    @Override
    public void insertSignon(Account account) {
        //数据库是必检异常，必须抛出异常
        try{
            //第一步，从DBUtil获取连接，赋值到connection
            Connection connection = DBUtil.getConnection();
            //第二步，赋值sql语句
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SIGNON);
            //第三步，按照上面的sql语句(INSERT_SIGNON部分)来进行按行获取值
            //其中，1、2表示是第一列和第二列
            preparedStatement.setString(1,account.getPassword());
            preparedStatement.setString(2,account.getUsername());
            //注：SELECT语句需要返回result结果集（if判定）
            //ResultSet resultSet = pStatement.executeQuery();
            //如果方法的返回值类型是<List>，那么需要用while判定
            //如果不是SELECT，那么就用pStatement.executeUpdate();
            preparedStatement.executeUpdate();
            //然后释放连接
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertAccount(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT);
            preparedStatement.setString(1, account.getEmail());
            preparedStatement.setString(2,account.getFirstName());
            preparedStatement.setString(3,account.getLastName());
            preparedStatement.setString(4,account.getStatus());
            preparedStatement.setString(5,account.getAddress1());
            preparedStatement.setString(6,account.getAddress2());
            preparedStatement.setString(7,account.getCity());
            preparedStatement.setString(8,account.getState());
            preparedStatement.setString(9,account.getZip());
            preparedStatement.setString(10,account.getCountry());
            preparedStatement.setString(11,account.getPhone());
            preparedStatement.setString(12,account.getUsername());

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void insertProfile(Account account) {

        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROFILE);
            preparedStatement.setString(1,account.getLanguagePreference());
            preparedStatement.setString(2,account.getFavouriteCategoryId());
            preparedStatement.setString(3,account.getUsername());
            preparedStatement.setBoolean(4,account.isListOption());
            preparedStatement.setBoolean(5,account.isBannerOption());

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void updateSignon(Account account) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SIGNON);
            preparedStatement.setString(1,account.getPassword());
            preparedStatement.setString(2,account.getUsername());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateAccount(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_ACCOUNT);
            pStatement.setString(1, account.getEmail());
            pStatement.setString(2,account.getFirstName());
            pStatement.setString(3,account.getLastName());
            pStatement.setString(4,account.getStatus());
            pStatement.setString(5,account.getAddress1());
            pStatement.setString(6,account.getAddress2());
            pStatement.setString(7,account.getCity());
            pStatement.setString(8,account.getState());
            pStatement.setString(9,account.getZip());
            pStatement.setString(10,account.getCountry());
            pStatement.setString(11,account.getPhone());
            pStatement.setString(12,account.getUsername());

            pStatement.executeUpdate();

            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateProfile(Account account) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_PROFILE);
            pStatement.setString(1, account.getLanguagePreference());
            pStatement.setString(2,account.getFavouriteCategoryId());
            pStatement.setBoolean(3,account.isListOption());
            pStatement.setBoolean(4,account.isBannerOption());
            pStatement.setString(5,account.getUsername());

            pStatement.executeUpdate();

            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Account getAccountByUsername(String username) {
        Account account = null;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(getAccountByUsernameString);
            preparedStatement.setString(1,username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                account = new Account();
                account.setUsername(resultSet.getString(1));
                account.setEmail(resultSet.getString(2));
                account.setFirstName(resultSet.getString(3));
                account.setLastName(resultSet.getString(4));
                account.setStatus(resultSet.getString(5));
                account.setAddress1(resultSet.getString(6));
                account.setAddress2(resultSet.getString(7));
                account.setCity(resultSet.getString(8));
                account.setState(resultSet.getString(9));
                account.setZip(resultSet.getString(10));
                account.setCountry(resultSet.getString(11));
                account.setPhone(resultSet.getString(12));
                account.setLanguagePreference(resultSet.getString(13));
                account.setFavouriteCategoryId(resultSet.getString(14));
                account.setListOption(resultSet.getBoolean(15));
                account.setBannerOption(resultSet.getBoolean(16));
                account.setBannerName(resultSet.getString(17));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public Account getAccountByUsernameAndPassword(Account account) {
        Account ac = null;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CATEGORY_LIST);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                ac = new Account();
                ac.setUsername(resultSet.getString(1));
                ac.setEmail(resultSet.getString(2));
                ac.setFirstName(resultSet.getString(3));
                ac.setLastName(resultSet.getString(4));
                ac.setState(resultSet.getString(5));
                ac.setAddress1(resultSet.getString(6));
                ac.setAddress2(resultSet.getString(7));
                ac.setCity(resultSet.getString(8));
                ac.setState(resultSet.getString(9));
                ac.setZip(resultSet.getString(10));
                ac.setCountry(resultSet.getString(11));
                ac.setPhone(resultSet.getString(12));
                ac.setLanguagePreference(resultSet.getString(13));
                ac.setFavouriteCategoryId(resultSet.getString(14));
                ac.setListOption(resultSet.getBoolean(15));
                ac.setBannerOption(resultSet.getBoolean(16));
                ac.setBannerName(resultSet.getString(17));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ac;
    }
}
