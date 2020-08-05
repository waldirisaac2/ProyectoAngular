import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpresaEgreComponent } from './empresa-egre.component';

describe('EmpresaEgreComponent', () => {
  let component: EmpresaEgreComponent;
  let fixture: ComponentFixture<EmpresaEgreComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmpresaEgreComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpresaEgreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
