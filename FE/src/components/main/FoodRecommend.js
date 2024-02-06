import React, { useState } from 'react';
import recommendicon from '../../assets/images/main/recommendicon.svg';
import recommendtext from '../../assets/images/main/recommendtext.svg';

function FoodRecommend() {
  const [modalVisible, setModalVisible] = useState(false);

  const openModal = () => {
    setModalVisible(true);
  };

  const closeModal = () => {
    setModalVisible(false);
  };

  return (
    <div>
      <img src={recommendtext} alt="Food Recommendation" style={textImageStyle} />

      <img
        src={recommendicon}
        alt="Click to open modal"
        onClick={openModal}
        style={{ cursor: 'pointer', ...iconImageStyle }}
      />

      {modalVisible && (
        <div className="modal-overlay" onClick={closeModal}>
          <div className="modal-content" style={modalContentStyle}>
            <span onClick={closeModal} style={closeButtonStyle}>
              &times;
            </span>
            {/* 내용을 원하는 대로 추가하세요. */}
            <p>여기에 모달 내용을 추가하세요.</p>
          </div>
        </div>
      )}
    </div>
  );
}

const textImageStyle = {
  margintop: '500px', 
};

const iconImageStyle = {
  margintop: '300px'
};

const modalContentStyle = {
  backgroundColor: 'white',
  padding: '20px',
  borderRadius: '10px',
  boxShadow: '0 0 10px rgba(0, 0, 0, 0.5)',
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: '400px', 
  height: '500px', 
};

const closeButtonStyle = {
  position: 'absolute',
  top: '10px',
  right: '10px',
  fontSize: '20px',
  cursor: 'pointer',
};

export default FoodRecommend;


