import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListNIPRComponent } from './get-list-nipr.component';

describe('GetListNIPRComponent', () => {
  let component: GetListNIPRComponent;
  let fixture: ComponentFixture<GetListNIPRComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListNIPRComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListNIPRComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
