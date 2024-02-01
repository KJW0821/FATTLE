// const BASE_URL = 'https://www.i10E106.p.ssafy.io';
const BASE_URL = 'http://i10e106.p.ssafy.io:8000';
// const BASE_URL = 'http://localhost:7979';

export const API = {
  MYPAGE_GET: `${BASE_URL}/user/mypage/`, // get + put
  FOLLOWER_GET: `${BASE_URL}/user/mypage/follower/`,
  FOLLOWING_GET: `${BASE_URL}/user/mypage/following/`,
  GOAL_GET: `${BASE_URL}/user/mypage/getGoal/`,
  KAKAO_GET: `${BASE_URL}/oauth/login/kakao?code=`,
  LOGIN_CALLBACK_GET: `${BASE_URL}/user/login/`,
  LOGIN_GET: `${BASE_URL}/oauth/code/kakao`,
  NICKNAME_GET: `${BASE_URL}/user/nickname/`,
};