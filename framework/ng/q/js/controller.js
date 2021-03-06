var SelectCtrl = function($scope) {
    $scope.onepiece = {
        '船長': {
            name: '蒙其·D·魯夫',
            age: 19,
            skills: ['橡膠槍', '橡膠火箭砲', '換檔', '霸氣']
        },
        '劍士': {
            name: '羅羅亞·索隆',
            age: 21,
            skills: ['無刀流', '煩惱鳳', '阿修羅', '霸氣']
        },
        '航海士': {
            name: '娜美',
            age: 20,
            skills: ['天候棒', '魔法天候棒', '棍術']
        },
        '狙擊手': {
            name: '騙人布',
            age: 19,
            skills: ['鐵鎚', '超巨大火鳥星', '必殺‧鐵人彗星']
        },
        '廚師': {
            name: '香吉士',
            age: 21,
            skills: ['肩肉 SHOOT', '惡魔風腳', '六式', '霸氣']
        },
        '船醫': {
            name: '多尼多尼·喬巴',
            age: 17,
            skills: ['腳力強化', '頭腦強化', '彈力強化', '毛皮強化', '腕力強化']
        },
        '考古學家': {
            name: '妮可·羅賓',
            age: 30,
            skills: ['眼花繚亂', '六十輪花', '百花繚亂', '萬紫千紅']
        },
        '船匠': {
            name: '佛朗基',
            age: 36,
            skills: ['佛朗基火球', '風來噴射', '鋼鐵海賊', '佛朗基將軍', '將軍砲']
        },
        '音樂家': {
            name: '布魯克',
            age: 90,
            skills: ['催眠曲·輪舞', '鼻唄三丁·矢筈斬', '冰凍劍', '哼歌·吹雪斬']
        }
    };

    $scope.result = '';
    $scope.changeCount = 0;
    $scope.change = function(){
        $scope.changeCount++;
        $scope.result = $scope.role + '(變更了 ' + $scope.changeCount + ' 次)';
    };
};