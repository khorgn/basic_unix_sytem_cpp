add gtest\_main.a and gmock\_main.a (usually renamed libgtest.a and libgmock.a)

MOCK\_METHODn and MOCK\_CONST\_METHODn are used to wrap the virtual methods to use. n is the number of arguments in the method to wrap  
MOCK\_METHOD0(methodName, return\_type())  
MOCK\_METHOD3(methodName, return\_type(param1\_type param1, param2\_type param2, param3\_type param3))

the methods to wrap must be virtual  
the destructor must be virtual

if the return type is an object with a default constructor, it will be what is returned if not defined through WillOnce() Will...()

```
TEST(...)
{
	{
		InSequence s;
		
		for (int i=1 ; i<=n ; ++i)
		{
			EXPECT_CALL(turtle, GetX())
				.WillOnce(Return(10*i))
				.RetiresOnSaturation();
		}
	}
}
```
