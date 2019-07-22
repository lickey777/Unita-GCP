const fs = require('fs');

const privkeys = process.env.PRIVKEYS;
const addrs = process.env.ADDRS;
const replicas = process.env.REPLICAS;
const podName = process.env.MY_POD_NAME;
const chainNAME = process.env.CHAIN_NAME;

//  get pod-name-number
spstr = podName.split("");
podNumber = Number(spstr[spstr.length - 1]);

console.log(privkeys);
console.log(addrs);

function checkArray(array, replica){
    const array_num = array.length
    if(array_num < replica){
        let i;
        for(i = array_num; i < 5; i++){
            array[i] = "0";
        }
    }
    if(array_num > replica){
        let j;
        for(j = replica; j < 5; j++){
            array[j] = "0";
        }
    }
    return array;
}

const obj = {
    "name": '',
    "addr": '',
    "privkey": '',
    "success": false
};

obj.addr = checkArray(addrs.split(","), replicas)[podNumber];
obj.privkey = checkArray(privkeys.split(","), replicas)[podNumber];
obj.name = chainNAME;
if(obj.addr !== "0" && obj.privkey !== "0"){
    obj.success = true;
}

try{
    fs.writeFileSync(
        './addr.json', JSON.stringify(obj), 'utf8'
    )
} catch (e) {
    console.log(e)
}
