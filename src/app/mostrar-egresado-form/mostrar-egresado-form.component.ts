import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EgresadoService } from '../services/egresado.service';

@Component({
  selector: 'app-mostrar-egresado-form',
  templateUrl: './mostrar-egresado-form.component.html',
  styleUrls: ['./mostrar-egresado-form.component.css']
})
export class MostrarEgresadoFormComponent implements OnInit {

  EgresadoForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private egresadoService: EgresadoService,
  ) {
  }
  ngOnInit() {

    this.EgresadoForm = this.formBuild.group({
      
      egresado_id: [''],
      egresado_nombre: ['', [Validators.required]],
      egresado_ap_materno: ['', [Validators.required]],
      egresado_ap_paterno: ['', [Validators.required]],
      egresado_estado: ['', [Validators.required]],
      egresado_dni: ['', [Validators.required]],
      egresado_fecha_nacimiento: ['', [Validators.required]],
      egresado_celular: ['', [Validators.required]],
      egresado_codigo: ['', [Validators.required]],
      roles_id: ['', [Validators.required]],
      ep_id: ['', [Validators.required]],
    });
    //get data
    let egresado_id = this.route.snapshot.paramMap.get('id');
    if (egresado_id != null) {
      this.egresadoService.getById(egresado_id).subscribe(response => {
        this.EgresadoForm.setValue(response);
        console.log(response);
      });
    }

  }
  save() {
    console.log(this.EgresadoForm.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.egresadoService.update(id, this.EgresadoForm.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.egresadoService.add(this.EgresadoForm.value).subscribe(response => {
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/mostraregresadosindex']);
  }


}
