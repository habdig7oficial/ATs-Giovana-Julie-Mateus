const co2Data = [
    { 
        country: 'Japan', 
        emission: 9.13,
        flag: "https://www.worldometers.info/img/flags/ja-flag.gif"
    },
    { 
        country: 'United States', 
        emission: 17.74,
        flag: "https://www.worldometers.info/img/flags/us-flag.gif"
    },
    { 
        country: 'Brazil', 
        emission: 6.78,
        flag: "https://www.worldometers.info/img/flags/br-flag.gif"
    },
    { 
        country: 'China', 
        emission: 8.4,
        flag: "https://www.worldometers.info/img/flags/ch-flag.gif"
    },
    { 
        country: 'Russia', 
        emission: 13.79,
        flag: "https://www.worldometers.info/img/flags/rs-flag.gif"
    },
    { 
        country: 'Germany', 
        emission: 9.37,
        flag: "https://www.worldometers.info/img/flags/gm-flag.gif"
    },
    { 
        country: 'Iran', 
        emission: 10.13,
        flag: "https://www.worldometers.info/img/flags/ir-flag.gif"
    },
    { 
        country: 'Canada', 
        emission: 20.6,
        flag: "https://www.worldometers.info/img/flags/ca-flag.gif"
    },
    { 
        country: 'European Union', 
        emission: 7.46,
        flag: "https://www.nationsonline.org/flags_big/EU_lgflag.gif"
    }
];



let troca,retorno;



document.addEventListener("DOMContentLoaded",function (params) {

    let main = document.querySelector("main");
    

    for (let i = 0; i < co2Data.length-1; i++) {
        for (let j = i + 1; j < co2Data.length; j++) {
           if (co2Data[i].emission < co2Data[j].emission) {
              troca = co2Data[j];
              co2Data[j] = co2Data[i];
              co2Data[i] = troca;
              
           }
        }
    }

    console.log(co2Data)


    function bloco (classe,classe2,src,alt,titulo,legenda,) {
        let div = document.createElement("div");
        let div1 = document.createElement("div");
        let div2 = document.createElement("div");
        let img = document.createElement("img");
        let h1 = document.createElement("h1");
        let h2 = document.createElement("h2");

        div1.className = classe
        div2.className = classe2


        img.src = src;
        img.alt = alt

        h1.innerHTML = titulo
        h2.innerHTML = legenda

        div.appendChild(div1)
        div1.appendChild(img)
        div1.appendChild(div2)
        div2.appendChild(h1)
        div2.appendChild(h2)

        return div;

    }

    for (let i = 0; i < co2Data.length-1; i++) {

        retorno = bloco("linha","coluna",co2Data[i].flag,"bandeira do emissor",co2Data[i].country,co2Data[i].emission + " de CO2")
        
        main.appendChild(retorno)
    }


})

