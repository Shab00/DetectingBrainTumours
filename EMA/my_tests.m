function tests = my_tests()
    tests = functiontests(localfunctions);
end

% One test
function test_one(testCase)
    testCase.assertTrue(true)
end

% Another test
function test_two(testCase)
    testCase.assertFalse(true);
end