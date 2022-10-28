import { Controller } from "@hotwired/stimulus"
import IMask from 'imask';

export default class extends Controller {
  static targets = ['cellPhone', 'cpf', 'cns', 'cep'];

  connect() {
    this.maskedFields();
  }

  maskedFields() {
    if (this.hasCellPhoneTarget) {
      this.maskCellPhone();
    }

    if (this.hasCpfTarget) {
      this.maskCpf();
    }

    if (this.hasCnsTarget) {
      this.maskCns();
    }

    if (this.hasCepTarget) {
      this.maskCep();
    }
  }

  get cellPhone() {
    return this.cellPhoneTarget;
  }

  get cpf() {
    return this.cpfTarget;
  }

  get cns() {
    return this.cnsTarget;
  }

  get cep() {
    return this.cepTarget;
  }

  maskCellPhone() {
    const options = {
      mask: '+00 (00) 00000-0000'
    };

    IMask(this.cellPhone, options);
  }

  maskCpf() {
    const options = {
      mask: '000.000.000-00'
    };

    IMask(this.cpf, options);
  }

  maskCns() {
    const options = {
      mask: '000 0000 0000 0000'
    };

    IMask(this.cns, options);
  }

  maskCep() {
    const options = {
      mask: '00000-000'
    };

    IMask(this.cep, options);
  }
}