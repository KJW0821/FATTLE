import { Routes, Route, Navigate } from 'react-router-dom';
import Join from './pages/join/Join';
import Mypage from './pages/mypage/Mypage';
import Auth from './utils/Auth';
import MypageModify from './pages/mypage/MypageModify';
import FollowList from './pages/mypage/FollowList';
import Goal from './pages/mypage/Goal';

//styles
import styles from './styles/App.module.css';
import Callback from './pages/login/SosialLogin/Login-callback';

function App() {
  let isLogged = false;
  return (
    <div className={styles.wrapper}>
      <Routes>
        <Route path="/mypage" element={<Mypage />}></Route>
        <Route path="/mypage/follow" element={<FollowList />} />
        <Route path="/mypageModify" element={<MypageModify />} />
        <Route path="/mypage/goal" element={<Goal />} />
        <Route path="/" element={<Auth isLogged={isLogged} />} />
        <Route path="/login" element={<Auth isLogged={isLogged} />} />
        <Route path="/join" element={<Join></Join>}></Route>
        <Route path="/login-callback" element={<Callback />}></Route>
      </Routes>
    </div>
  );
}
export default App;
