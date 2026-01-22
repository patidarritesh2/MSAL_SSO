import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'custCurrency'
})
export class CustCurrencyPipe implements PipeTransform {

  transform(value: any, args?: any): any {
    // value = value ? value.replace("+91 ", "").replace(/\D/g, "") : ''   
    if (value.length == 10) {
      
      let x = value.match(/(\d{0,5})(\d{0,5})/);
      value = !x[2] ? x[1] :  x[1] + "-" + x[2] + (x[3] ? "-" + x[3] : "");

      value = "+91 " + value;
    }
    return value;
  }

}
//+91 (456)-655-4366