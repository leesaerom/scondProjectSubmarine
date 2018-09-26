package journey.diary.test.DAO;

import journey.diary.test.VO.User;

public interface UserMapper {

	public int checkEmail(String useremail);

	public int registerMember(User user);

	public User selectOne(User user);
	
	public User selectUserProfile(int userno);
}
