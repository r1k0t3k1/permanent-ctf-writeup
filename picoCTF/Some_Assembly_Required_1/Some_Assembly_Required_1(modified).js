// array
const array = [
  'value', //0
  '2wfTpTR', //1
  'instantiate', //2
  '275341bEPcme', //3
  'innerHTML', //4
  '1195047NznhZg', //5
  '1qfevql', //6
  'input',  //7
  '1699808QuoWhA', //8
  'Correct!',  //9
  'check_flag', //10
  'Incorrect!', //11
  './JIFxzHyW8W', //12
  '23SMpAuA', //13
  '802698XOMSrr',  //14
  'charCodeAt',  //15
  '474547vVoGDO', //16
  'getElementById',  //17
  'instance', //18
  'copy_char', //19
  '43591XxcWUl', //20
  '504454llVtzW', //21
  'arrayBuffer', //22
  '2NIQmVj',  //23
  'result' //24
];

const shiftefArray = [
  'instance', //0
  'copy_char', //1
  '43591XxcWUl', //2
  '504454llVtzW', //3
  'arrayBuffer', //4
  '2NIQmVj',  //5
  'result', //6
  'value', //7
  '2wfTpTR', //8
  'instantiate', //9
  '275341bEPcme', //10
  'innerHTML', //11
  '1195047NznhZg', //12
  '1qfevql', //13
  'input',  //14
  '1699808QuoWhA', //15
  'Correct!',  //16
  'check_flag', //17
  'Incorrect!', //18
  './JIFxzHyW8W', //19
  '23SMpAuA', //20
  '802698XOMSrr',  //21
  'charCodeAt',  //22
  '474547vVoGDO', //23
  'getElementById',  //24
];


// func1 
const func1 = function (index) {
  index = index - 470; //0x1d6 
  let result = array[index];
  return result;
};

(
  function (param1,param2) {
    // const fn1 = func1;
    while (!![]) {
      try {
        const parseNumberTotal = - parseInt(fn1(491))
                          + parseInt(fn1(493))
                          + -parseInt(fn1(475)) 
                          * -parseInt(fn1(473)) 
                          + -parseInt(fn1(482)) 
                          * -parseInt(fn1(483)) 
                          + -parseInt(fn1(478)) 
                          * parseInt(fn1(480)) 
                          + parseInt(fn1(472)) 
                          * parseInt(fn1(490)) 
                          + -parseInt(fn1(485));
        if (parseNumberTotal === param2) break;
        else
        param1['push'](param1['shift']());
      }
      catch (exception) {
        param1['push'](param1['shift']());
      }
    }
  }
  (array, 627907)
);


let exports;
(async () => {
  let assembly = await fetch('./JIFxzHyW8W'),
      buf = await WebAssembly['instantiate'](await assembly['arrayBuffer']()),
      instance = buf['instance'];
  exports = instance['exports'];
})();

function onButtonPress() {
  let input_value = document['getElementById']('input')['value'];
  for (let i = 0; i < input_value['length']; i++) {
    exports['copy_char'](input_value['charCodeAt'](i), i);
  }
  exports['copy_char'](0, input_value['length'])
  
  if(exports['check_flag']() == 1){
    document['input']('result')['innerHTML'] = 'Correct!' 
  }else{
    document['getElementById']('result')['innerHTML'] = 'Incorrect!'
  }
}