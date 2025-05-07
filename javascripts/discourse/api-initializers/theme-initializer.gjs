import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  // Your code here
 /*api.onPageChange(() => {
    const isAnonymous = !api.getCurrentUser();
    const hasDismissed = localStorage.getItem('popupBannerDismissed');
    const isHomePage = location.pathname === '/' || location.pathname === '/categories';

    if (isAnonymous && isHomePage && !hasDismissed) {
      if (document.querySelector('.popup-banner')) return;

      const popup = document.createElement('div');
      popup.className = 'popup-banner';
      popup.innerHTML = `
        <div class="close">&times;</div>
<p style="text-align:center"><span style="font-family:Comic Sans MS,cursive"><big><span style="font-size:36px">Want to join in the discussion?</span></big></span></p>
<p style="text-align:center"><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Registering an account, then you can participate in replying and posting !</span></span></p>
        <button class="signup-btn">Sign Up</button><br><br/>
      `;
      document.body.appendChild(popup);

      // 關閉按鈕
      popup.querySelector('.close').addEventListener('click', () => {
        popup.remove();
        localStorage.setItem('popupBannerDismissed', 'true');
      });

      // 點擊「立即註冊」後：模擬原始按鈕點擊 ＋ 關閉 popup
      popup.querySelector('.signup-btn').addEventListener('click', () => {
        const realSignupBtn = document.querySelector('.sign-up-button');
        if (realSignupBtn) {
          realSignupBtn.click(); // 開啟註冊 modal
        }
        popup.remove(); // 立即移除 popup
        localStorage.setItem('popupBannerDismissed', 'true'); // 記錄不要再出現
      });
    }
  });*/
  

api.onPageChange(() => {
  const isAnonymous = !api.getCurrentUser();
  const hasDismissed = localStorage.getItem('popupBannerDismissed');

  if (isAnonymous && !hasDismissed) {
    if (document.querySelector('.popup-banner')) return;

    const popup = document.createElement('div');
    popup.className = 'popup-banner';
    popup.innerHTML = `
      <p style="text-align:center">
        <span style="font-family:Comic Sans MS,cursive">
          <big><span style="font-size:36px">Hello, User!</span></big>
        </span>
      </p>
      <hr />
      <p style="text-align:center">
        <span style="font-size:20px">
          <span style="font-family:Arial,Helvetica,sans-serif">
            Create an account
          </span>
        </span>
      </p>
      <p style="text-align:center">
        <span style="font-size:20px">
          <span style="font-family:Arial,Helvetica,sans-serif">
            to start posting and joining the conversation!
          </span>
        </span>
      </p>
      <div style="text-align:center">
        <button class="signup-btn">Sign Up</button>
        <button class="not-now-btn">Not Now</button>
      </div><br/>
    `;

    document.body.appendChild(popup);

    // 啟動動畫
    requestAnimationFrame(() => popup.classList.add('fade-in'));

    const closePopup = () => {
      popup.classList.remove('fade-in');
      popup.classList.add('fade-out');
      localStorage.setItem('popupBannerDismissed', 'true');
      setTimeout(() => popup.remove(), 300);
    };

    popup.querySelector('.not-now-btn').addEventListener('click', closePopup);

    popup.querySelector('.signup-btn').addEventListener('click', () => {
      const realSignupBtn = document.querySelector('.sign-up-button');
      if (realSignupBtn) realSignupBtn.click();
      closePopup();
    });
  }
});


  
});
