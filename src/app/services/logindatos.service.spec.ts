import { TestBed } from '@angular/core/testing';

import { LogindatosService } from './logindatos.service';

describe('LogindatosService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: LogindatosService = TestBed.get(LogindatosService);
    expect(service).toBeTruthy();
  });
});
