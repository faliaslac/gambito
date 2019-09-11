import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AnalisisCentrosComponent } from './analisis-centros.component';

describe('AnalisisCentrosComponent', () => {
  let component: AnalisisCentrosComponent;
  let fixture: ComponentFixture<AnalisisCentrosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AnalisisCentrosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AnalisisCentrosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
