C
C
C  Copyright (C) 2000, 2001 Silicon Graphics, Inc.  All Rights Reserved.
C
C  This program is free software; you can redistribute it and/or modify it
C  under the terms of version 2.1 of the GNU Lesser General Public License 
C  as published by the Free Software Foundation.
C
C  This program is distributed in the hope that it would be useful, but
C  WITHOUT ANY WARRANTY; without even the implied warranty of
C  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
C
C  Further, this software is distributed without any warranty that it is
C  free of the rightful claim of any third person regarding infringement 
C  or the like.  Any license provided herein, whether implied or 
C  otherwise, applies only to this software file.  Patent licenses, if
C  any, provided herein do not apply to combinations of this program with 
C  other software, or any other product whatsoever.  
C
C  You should have received a copy of the GNU Lesser General Public 
C  License along with this program; if not, write the Free Software 
C  Foundation, Inc., 59 Temple Place - Suite 330, Boston MA 02111-1307, 
C  USA.
C
C  Contact information:  Silicon Graphics, Inc., 1600 Amphitheatre Pky,
C  Mountain View, CA 94043, or:
C
C  http://www.sgi.com
C
C  For further information regarding this notice, see:
C
C  http://oss.sgi.com/projects/GenInfo/NoticeExplan
C
C


	subroutine SCANMAX_MASK_JS3@(result,source,stop,dim,mask,sext)
*
CDIR$ ID "@(#) libfi/mpp_scan/scanmax_s_3@.f	92.0	10/08/98 14:37:14"
************************************************************************
*
* Purpose:	Find the maximum value of the elements identified by mask,
*		while saving all intermediate results.  This routine handles
*		integer source arrays of rank 3. It returns an array result.
*		This routine is called by the C routine _SCANMAX_JS3.
*
* Arguments:	result	- integer array of rank 3.
*		source	- integer array of rank 3.
*		stop	- logical array of rank 1.
*		dim	- integer scalar: dimension to search along.
*		mask	- logical array of rank 3.
*		sext	- integer array of rank 1:
*			  extents of the source array.
*
* Variables:	carry	- working variable to save current value of carry
*		init_val- initial value of carry variable
*
* Intrinsic functions called:
*		my_pe()
*		hiidx()
*		lowidx()
*		home()
*
* Documentation:
*		T3D Fortran 90 Array Intrinsics Interface Description
*		T3D Fortran 90 Array Intrinsics Design Description
*
* Author:	Kenneth Bussart
*		System Libraries Section
*		Cray Research, Inc.
*
************************************************************************
	implicit	none
	integer		HUGE_INT
	integer		sext(3)
	integer		dim
	integer		source(sext(1),sext(2),sext(3))
	integer		result(sext(1),sext(2),sext(3))
	logical		stop(sext(1),sext(2),sext(3))
	logical		mask(sext(1),sext(2),sext(3))
	integer		i, j, k, p
	integer		carry
	integer		init_val
*
	integer		FUNC, arg1, arg2
*
cdir$	serial_only
*
	FUNC (arg1,arg2) = max (arg1,arg2)
*
	init_val = -HUGE_INT()
*
	if (dim .eq. 0) then
	    include "segscan_s3_dim0_mask.fh"
	else if (dim .eq. 1) then
	    include "segscan_s3_dim1_mask.fh"
	else if (dim .eq. 2) then
	    include "segscan_s3_dim2_mask.fh"
	else
	    include "segscan_s3_dim3_mask.fh"
	endif
*
	return
	end


	subroutine SCANMAX_NOMASK_JS3@(result,source,stop,dim,sext)
*
************************************************************************
*
* Purpose:	Find the maximum value of the elements in the array section,
*		while saving all intermediate results.  This routine handles
*		integer source arrays of rank 3.  It returns an array result.
*		This routine is called by the C routine _SCANMAX_JS3.
*
* Arguments:	result	- integer array of rank 3.
*		source	- integer array of rank 3.
*		stop	- logical array of rank 1.
*		dim	- integer scalar: dimension to search along.
*		sext	- integer array of rank 1:
*			  extents of the source array.
*
* Variables:	carry	- working variable to save current value of carry
*		init_val- initial value of carry variable
*
* Intrinsic functions called:
*		my_pe()
*		hiidx()
*		lowidx()
*		home()
*
* Documentation:
*		T3D Fortran 90 Array Intrinsics Interface Description
*		T3D Fortran 90 Array Intrinsics Design Description
*
* Author:	Kenneth Bussart
*		System Libraries Section
*		Cray Research, Inc.
*
************************************************************************
	implicit	none
	integer		HUGE_INT
	integer		sext(3)
	integer		dim
	integer		source(sext(1),sext(2),sext(3))
	integer		result(sext(1),sext(2),sext(3))
	logical		stop(sext(1),sext(2),sext(3))
	integer		i, j, k, p
	integer		carry
	integer		init_val
*
	integer		FUNC, arg1, arg2
*
cdir$	serial_only
*
	FUNC (arg1,arg2) = max (arg1,arg2)
*
	init_val = -HUGE_INT()
*
	if (dim .eq. 0) then
	    include "segscan_s3_dim0_nomask.fh"
	else if (dim .eq. 1) then
	    include "segscan_s3_dim1_nomask.fh"
	else if (dim .eq. 2) then
	    include "segscan_s3_dim2_nomask.fh"
	else
	    include "segscan_s3_dim3_nomask.fh"
	endif
*
	return
	end


	subroutine SCANMAX_MASK_SS3@(result,source,stop,dim,mask,sext)
*
************************************************************************
*
* Purpose:	Find the maximum value of the elements identified by mask,
*		while saving all intermediate results.  This routine handles
*		real source arrays of rank 3. It returns an array result.
*		This routine is called by the C routine _SCANMAX_SS3.
*
* Arguments:	result	- real array of rank 3.
*		source	- real array of rank 3.
*		stop	- logical array of rank 1.
*		dim	- integer scalar: dimension to search along.
*		mask	- logical array of rank 3.
*		sext	- integer array of rank 1:
*			  extents of the source array.
*
* Variables:	carry	- working variable to save current value of carry
*		init_val- initial value of carry variable
*
* Intrinsic functions called:
*		my_pe()
*		hiidx()
*		lowidx()
*		home()
*
* Documentation:
*		T3D Fortran 90 Array Intrinsics Interface Description
*		T3D Fortran 90 Array Intrinsics Design Description
*
* Author:	Kenneth Bussart
*		System Libraries Section
*		Cray Research, Inc.
*
************************************************************************
	implicit	none
	real		HUGE_FLT
	integer		sext(3)
	integer		dim
	real		source(sext(1),sext(2),sext(3))
	real		result(sext(1),sext(2),sext(3))
	logical		stop(sext(1),sext(2),sext(3))
	logical		mask(sext(1),sext(2),sext(3))
	integer		i, j, k, p
	real		carry
	real		init_val
*
	real		FUNC, arg1, arg2
*
cdir$	serial_only
*
	FUNC (arg1,arg2) = max (arg1,arg2)
*
	init_val = -HUGE_FLT()
*
	if (dim .eq. 0) then
	    include "segscan_s3_dim0_mask.fh"
	else if (dim .eq. 1) then
	    include "segscan_s3_dim1_mask.fh"
	else if (dim .eq. 2) then
	    include "segscan_s3_dim2_mask.fh"
	else
	    include "segscan_s3_dim3_mask.fh"
	endif
*
	return
	end


	subroutine SCANMAX_NOMASK_SS3@(result,source,stop,dim,sext)
*
************************************************************************
*
* Purpose:	Find the maximum value of the elements in the array section,
*		while saving all intermediate results.  This routine handles
*		real source arrays of rank 3.  It returns an array result.
*		This routine is called by the C routine _SCANMAX_SS3.
*
* Arguments:	result	- real array of rank 3.
*		source	- real array of rank 3.
*		stop	- logical array of rank 1.
*		dim	- integer scalar: dimension to search along.
*		sext	- integer array of rank 1:
*			  extents of the source array.
*
* Variables:	carry	- working variable to save current value of carry
*		init_val- initial value of carry variable
*
* Intrinsic functions called:
*		my_pe()
*		hiidx()
*		lowidx()
*		home()
*
* Documentation:
*		T3D Fortran 90 Array Intrinsics Interface Description
*		T3D Fortran 90 Array Intrinsics Design Description
*
* Author:	Kenneth Bussart
*		System Libraries Section
*		Cray Research, Inc.
*
************************************************************************
	implicit	none
	intrinsic	my_pe
	real		HUGE_FLT
	integer		sext(3)
	integer		dim
	real		source(sext(1),sext(2),sext(3))
	real		result(sext(1),sext(2),sext(3))
	logical		stop(sext(1),sext(2),sext(3))
	integer		i, j, k, p
	real		carry
	real		init_val
*
	real		FUNC, arg1, arg2
*
cdir$	serial_only
*
	FUNC (arg1,arg2) = max (arg1,arg2)
*
	init_val = -HUGE_FLT()
*
	if (dim .eq. 0) then
	    include "segscan_s3_dim0_nomask.fh"
	else if (dim .eq. 1) then
	    include "segscan_s3_dim1_nomask.fh"
	else if (dim .eq. 2) then
	    include "segscan_s3_dim2_nomask.fh"
	else
	    include "segscan_s3_dim3_nomask.fh"
	endif
*
	return
	end


!	subroutine SCANMAX_SH_MASK_JS3@(result,source,stop,dim,mask,sext)
!*
!************************************************************************
!*
!* Purpose:	Find the maximum value of the elements identified by mask,
!*		while saving all intermediate results.  This routine handles
!*		integer source arrays of rank 3. It returns an array result.
!*		This routine is called by the C routine _SCANMAX_JS3.
!*
!* Arguments:	result	- integer array of rank 3.
!*		source	- integer array of rank 3.
!*		stop	- integer array of rank 2.
!*		dim	- integer scalar: dimension to search along.
!*		mask	- logical array of rank 3.
!*		sext	- integer array of rank 1:
!*			  extents of the source array.
!*
!* Variables:	carry	- working variable to save current value of carry
!*		init_val- initial value of carry variable
!*
!* Intrinsic functions called:
!*		my_pe()
!*		hiidx()
!*		lowidx()
!*		home()
!*
!* Documentation:
!*		T3D Fortran 90 Array Intrinsics Interface Description
!*		T3D Fortran 90 Array Intrinsics Design Description
!*
!* Author:	Kenneth Bussart
!*		System Libraries Section
!*		Cray Research, Inc.
!*
!************************************************************************
!	implicit	none
!	integer		HUGE_INT
!	integer		sext(3)
!	integer		dim
!	integer		source(sext(1),sext(2),sext(3))
!	integer		result(sext(1),sext(2),sext(3))
!	logical		mask(sext(1),sext(2),sext(3))
!	logical		stop(sext(1),sext(2),sext(3))
!	integer		i, j, k, p
!	integer		carry
!	integer		init_val
!*
!	integer		FUNC, arg1, arg2
!*
!cdir$	serial_only
!cdir$	unknown_shared	source, stop, mask
!*
!	FUNC (arg1,arg2) = max (arg1,arg2)
!*
!	init_val = -HUGE_INT()
!*
!	if (dim .eq. 0) then
!	    include "segscan_s3_dim0_mask.fh"
!	else if (dim .eq. 1) then
!	    include "segscan_s3_dim1_mask.fh"
!	else if (dim .eq. 2) then
!	    include "segscan_s3_dim2_mask.fh"
!	else
!	    include "segscan_s3_dim3_mask.fh"
!	endif
!*
!	return
!	end
!
!
!	subroutine SCANMAX_SH_NOMASK_JS3@(result,source,stop,dim,sext)
!*
!************************************************************************
!*
!* Purpose:	Find the maximum value of the elements in the array section,
!*		while saving all intermediate results.  This routine handles
!*		integer source arrays of rank 3.  It returns an array result.
!*		This routine is called by the C routine _SCANMAX_JS3.
!*
!* Arguments:	result	- integer array of rank 3.
!*		source	- integer array of rank 3.
!*		stop	- integer array of rank 2.
!*		dim	- integer scalar: dimension to search along.
!*		sext	- integer array of rank 1:
!*			  extents of the source array.
!*
!* Variables:	carry	- working variable to save current value of carry
!*		init_val- initial value of carry variable
!*
!* Intrinsic functions called:
!*		my_pe()
!*		hiidx()
!*		lowidx()
!*		home()
!*
!* Documentation:
!*		T3D Fortran 90 Array Intrinsics Interface Description
!*		T3D Fortran 90 Array Intrinsics Design Description
!*
!* Author:	Kenneth Bussart
!*		System Libraries Section
!*		Cray Research, Inc.
!*
!************************************************************************
!	implicit	none
!	integer		HUGE_INT
!	integer		sext(3)
!	integer		dim
!	integer		source(sext(1),sext(2),sext(3))
!	integer		result(sext(1),sext(2),sext(3))
!	logical		stop(sext(1),sext(2),sext(3))
!	integer		i, j, k, p
!	integer		carry
!	integer		init_val
!*
!	integer		FUNC, arg1, arg2
!*
!cdir$	serial_only
!cdir$	unknown_shared	source
!*
!	FUNC (arg1,arg2) = max (arg1,arg2)
!*
!	init_val = -HUGE_INT()
!*
!	if (dim .eq. 0) then
!	    include "segscan_s3_dim0_nomask.fh"
!	else if (dim .eq. 1) then
!	    include "segscan_s3_dim1_nomask.fh"
!	else if (dim .eq. 2) then
!	    include "segscan_s3_dim2_nomask.fh"
!	else
!	    include "segscan_s3_dim3_nomask.fh"
!	endif
!*
!	return
!	end
!
!
!	subroutine SCANMAX_SH_MASK_SS3@(result,source,stop,dim,mask,sext)
!*
!************************************************************************
!*
!* Purpose:	Find the maximum value of the elements identified by mask,
!*		while saving all intermediate results.  This routine handles
!*		real source arrays of rank 3. It returns an array result.
!*		This routine is called by the C routine _SCANMAX_SS3.
!*
!* Arguments:	result	- real array of rank 3.
!*		source	- real array of rank 3.
!*		stop	- integer array of rank 2.
!*		dim	- integer scalar: dimension to search along.
!*		mask	- logical array of rank 3.
!*		sext	- integer array of rank 1:
!*			  extents of the source array.
!*
!* Variables:	carry	- working variable to save current value of carry
!*		init_val- initial value of carry variable
!*
!* Intrinsic functions called:
!*		my_pe()
!*		hiidx()
!*		lowidx()
!*		home()
!*
!* Documentation:
!*		T3D Fortran 90 Array Intrinsics Interface Description
!*		T3D Fortran 90 Array Intrinsics Design Description
!*
!* Author:	Kenneth Bussart
!*		System Libraries Section
!*		Cray Research, Inc.
!*
!************************************************************************
!	implicit	none
!	real		HUGE_FLT
!	integer		sext(3)
!	integer		dim
!	real		source(sext(1),sext(2),sext(3))
!	real		result(sext(1),sext(2),sext(3))
!	logical		stop(sext(1),sext(2),sext(3))
!	logical		mask(sext(1),sext(2),sext(3))
!	integer		i, j, k, p
!	real		carry
!	real		init_val
!*
!	real		FUNC, arg1, arg2
!*
!cdir$	serial_only
!cdir$	unknown_shared	source, stop, mask
!*
!	FUNC (arg1,arg2) = max (arg1,arg2)
!*
!	init_val = -HUGE_FLT()
!*
!	if (dim .eq. 0) then
!	    include "segscan_s3_dim0_mask.fh"
!	else if (dim .eq. 1) then
!	    include "segscan_s3_dim1_mask.fh"
!	else if (dim .eq. 2) then
!	    include "segscan_s3_dim2_mask.fh"
!	else
!	    include "segscan_s3_dim3_mask.fh"
!	endif
!*
!	return
!	end
!
!
!	subroutine SCANMAX_SH_NOMASK_SS3@(result,source,stop,dim,sext)
!*
!************************************************************************
!*
!* Purpose:	Find the maximum value of the elements in the array section,
!*		while saving all intermediate results.  This routine handles
!*		real source arrays of rank 3.  It returns an array result.
!*		This routine is called by the C routine _SCANMAX_SS3.
!*
!* Arguments:	result	- real array of rank 3.
!*		source	- real array of rank 3.
!*		stop	- integer array of rank 2.
!*		dim	- integer scalar: dimension to search along.
!*		sext	- integer array of rank 1:
!*			  extents of the source array.
!*
!* Variables:	carry	- working variable to save current value of carry
!*		init_val- initial value of carry variable
!*
!* Intrinsic functions called:
!*		my_pe()
!*		hiidx()
!*		lowidx()
!*		home()
!*
!* Documentation:
!*		T3D Fortran 90 Array Intrinsics Interface Description
!*		T3D Fortran 90 Array Intrinsics Design Description
!*
!* Author:	Kenneth Bussart
!*		System Libraries Section
!*		Cray Research, Inc.
!*
!************************************************************************
!	implicit	none
!	real		HUGE_FLT
!	integer		sext(3)
!	integer		dim
!	real		source(sext(1),sext(2),sext(3))
!	real		result(sext(1),sext(2),sext(3))
!	logical		stop(sext(1),sext(2),sext(3))
!	integer		i, j, k, p
!	real		carry
!	real		init_val
!*
!	real		FUNC, arg1, arg2
!*
!cdir$	serial_only
!cdir$	unknown_shared	source
!*
!	FUNC (arg1,arg2) = max (arg1,arg2)
!*
!	init_val = -HUGE_FLT()
!*
!	if (dim .eq. 0) then
!	    include "segscan_s3_dim0_nomask.fh"
!	else if (dim .eq. 1) then
!	    include "segscan_s3_dim1_nomask.fh"
!	else if (dim .eq. 2) then
!	    include "segscan_s3_dim2_nomask.fh"
!	else
!	    include "segscan_s3_dim3_nomask.fh"
!	endif
!*
!	return
!	end
