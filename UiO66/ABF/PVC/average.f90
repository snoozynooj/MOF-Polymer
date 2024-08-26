program force
      implicit none
      real*8,dimension(1:300000)::rx,ry,rz
      real*8, dimension(1:10)::minx,miny
      integer ,dimension(1:300000)::count1
      integer::i, j, start1,N
      real*8::min2
      do i =1,250000
      rx(i) = 0.0
      ry(i) = 0.0
      rz(i) = 0.0
      count1(i) = 0
      end do

      N = 40000
      open (100, file="G_integrated.txt", status="old")

      do i = 1,N
        read(100,*) rx(i), ry(i), rz(i)
      end do


     min2 = rz(1)
     do i = 1,40000
!        if ((rx(i) .le. 27.0D0 ) .and. (rx(i) .ge. 12.0D0 )) then
            if (rz(i) < min2) then
                min2 = rz(i)
            end if
!        end if
    end do

10000  format (F10.3,F10.3,F10.5)
    do i = 1,N
        write(101,10000) rx(i), ry(i), rz(i)+abs(min2)
      end do
    
      close(100)
      close(101)
      end program
