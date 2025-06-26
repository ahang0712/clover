; ModuleID = 'svp_simple_033_001-opt.bc'
source_filename = "./svp_simple_033_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_init() #0 !dbg !7 {
  %1 = call i32 (...) @rand(), !dbg !10
  %2 = trunc i32 %1 to i16, !dbg !10
  store volatile i16 %2, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !11, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !16
  %4 = trunc i32 %3 to i16, !dbg !16
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !17, !tbaa !12
  call void (...) @init(), !dbg !18
  ret void, !dbg !19
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !20 {
  %1 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !21, !tbaa !12
  %2 = zext i16 %1 to i32, !dbg !21
  %3 = icmp sge i32 %2, 16, !dbg !22
  br i1 %3, label %4, label %13, !dbg !21

4:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !23, !tbaa !12
  br label %5, !dbg !24

5:                                                ; preds = %10, %4
  %.0 = phi i32 [ 0, %4 ], [ %11, %10 ], !dbg !25
  %6 = icmp slt i32 %.0, 256, !dbg !26
  br i1 %6, label %7, label %12, !dbg !27

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64, !dbg !28
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %8, !dbg !28
  store volatile i8 0, i8* %9, align 1, !dbg !29, !tbaa !30
  br label %10, !dbg !31

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1, !dbg !32
  br label %5, !dbg !27, !llvm.loop !33

12:                                               ; preds = %5
  br label %13, !dbg !34

13:                                               ; preds = %12, %0
  ret void, !dbg !35
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_main() #0 !dbg !36 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !37
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %2) #3, !dbg !37
  %3 = call i32 (...) @rand(), !dbg !38
  %4 = trunc i32 %3 to i16, !dbg !38
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !39, !tbaa !12
  %5 = call i32 (...) @rand(), !dbg !40
  %6 = trunc i32 %5 to i16, !dbg !40
  store volatile i16 %6, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !41, !tbaa !12
  call void (...) @init(), !dbg !42
  %7 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !43, !tbaa !12
  %8 = zext i16 %7 to i32, !dbg !43
  %9 = icmp sge i32 %8, 16, !dbg !44
  br i1 %9, label %10, label %19, !dbg !43

10:                                               ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !45, !tbaa !12
  br label %11, !dbg !46

11:                                               ; preds = %16, %10
  %.0 = phi i32 [ 0, %10 ], [ %17, %16 ], !dbg !47
  %12 = icmp slt i32 %.0, 256, !dbg !48
  br i1 %12, label %13, label %18, !dbg !49

13:                                               ; preds = %11
  %14 = sext i32 %.0 to i64, !dbg !50
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %14, !dbg !50
  store volatile i8 0, i8* %15, align 1, !dbg !51, !tbaa !30
  br label %16, !dbg !52

16:                                               ; preds = %13
  %17 = add nsw i32 %.0, 1, !dbg !53
  br label %11, !dbg !49, !llvm.loop !54

18:                                               ; preds = %11
  br label %19, !dbg !55

19:                                               ; preds = %18, %0
  br label %20, !dbg !56

20:                                               ; preds = %41, %19
  %.01 = phi i32 [ 0, %19 ], [ %42, %41 ], !dbg !47
  %21 = icmp slt i32 %.01, 2, !dbg !57
  br i1 %21, label %22, label %43, !dbg !58

22:                                               ; preds = %20
  %23 = icmp eq i32 %.01, 0, !dbg !59
  br i1 %23, label %24, label %26, !dbg !60

24:                                               ; preds = %22
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !61, !tbaa !62
  %25 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !64, !tbaa !12
  store volatile i16 %25, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !65, !tbaa !12
  br label %28, !dbg !66

26:                                               ; preds = %22
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !67, !tbaa !62
  %27 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !68, !tbaa !12
  store volatile i16 %27, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !69, !tbaa !12
  br label %28

28:                                               ; preds = %26, %24
  %29 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !70, !tbaa !62
  %30 = getelementptr inbounds i8, i8* %29, i64 2, !dbg !71
  %31 = load volatile i8, i8* %30, align 1, !dbg !72, !tbaa !30
  %32 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !73
  store i8 %31, i8* %32, align 1, !dbg !74, !tbaa !75
  %33 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !77, !tbaa !62
  %34 = getelementptr inbounds i8, i8* %33, i64 4, !dbg !78
  %35 = load volatile i8, i8* %34, align 1, !dbg !79, !tbaa !30
  %36 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !80
  store i8 %35, i8* %36, align 1, !dbg !81, !tbaa !82
  %37 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !83, !tbaa !62
  %38 = getelementptr inbounds i8, i8* %37, i64 5, !dbg !84
  %39 = load volatile i8, i8* %38, align 1, !dbg !85, !tbaa !30
  %40 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !86
  store i8 %39, i8* %40, align 1, !dbg !87, !tbaa !88
  br label %41, !dbg !89

41:                                               ; preds = %28
  %42 = add nsw i32 %.01, 1, !dbg !90
  br label %20, !dbg !58, !llvm.loop !91

43:                                               ; preds = %20
  %44 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !92
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %44) #3, !dbg !92
  ret void, !dbg !92
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !93 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !94, !tbaa !95
  %2 = lshr i32 %1, 3, !dbg !97
  %3 = and i32 %2, 8191, !dbg !98
  %4 = trunc i32 %3 to i16, !dbg !99
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !100, !tbaa !12
  ret void, !dbg !101
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_033_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_033")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 36, type: !9, scopeLine: 36, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_033_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_033")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 37, column: 48, scope: !7)
!11 = !DILocation(line: 37, column: 46, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 38, column: 48, scope: !7)
!17 = !DILocation(line: 38, column: 46, scope: !7)
!18 = !DILocation(line: 40, column: 3, scope: !7)
!19 = !DILocation(line: 41, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 47, column: 7, scope: !20)
!22 = !DILocation(line: 47, column: 50, scope: !20)
!23 = !DILocation(line: 48, column: 48, scope: !20)
!24 = !DILocation(line: 50, column: 10, scope: !20)
!25 = !DILocation(line: 0, scope: !20)
!26 = !DILocation(line: 50, column: 19, scope: !20)
!27 = !DILocation(line: 50, column: 5, scope: !20)
!28 = !DILocation(line: 51, column: 7, scope: !20)
!29 = !DILocation(line: 51, column: 43, scope: !20)
!30 = !{!14, !14, i64 0}
!31 = !DILocation(line: 52, column: 5, scope: !20)
!32 = !DILocation(line: 50, column: 27, scope: !20)
!33 = distinct !{!33, !27, !31}
!34 = !DILocation(line: 54, column: 3, scope: !20)
!35 = !DILocation(line: 55, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 57, type: !9, scopeLine: 57, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 58, column: 3, scope: !36)
!38 = !DILocation(line: 60, column: 50, scope: !36)
!39 = !DILocation(line: 60, column: 48, scope: !36)
!40 = !DILocation(line: 61, column: 50, scope: !36)
!41 = !DILocation(line: 61, column: 48, scope: !36)
!42 = !DILocation(line: 63, column: 5, scope: !36)
!43 = !DILocation(line: 68, column: 9, scope: !36)
!44 = !DILocation(line: 68, column: 52, scope: !36)
!45 = !DILocation(line: 69, column: 50, scope: !36)
!46 = !DILocation(line: 71, column: 12, scope: !36)
!47 = !DILocation(line: 0, scope: !36)
!48 = !DILocation(line: 71, column: 21, scope: !36)
!49 = !DILocation(line: 71, column: 7, scope: !36)
!50 = !DILocation(line: 72, column: 9, scope: !36)
!51 = !DILocation(line: 72, column: 45, scope: !36)
!52 = !DILocation(line: 73, column: 7, scope: !36)
!53 = !DILocation(line: 71, column: 29, scope: !36)
!54 = distinct !{!54, !49, !52}
!55 = !DILocation(line: 75, column: 5, scope: !36)
!56 = !DILocation(line: 77, column: 8, scope: !36)
!57 = !DILocation(line: 77, column: 25, scope: !36)
!58 = !DILocation(line: 77, column: 3, scope: !36)
!59 = !DILocation(line: 78, column: 15, scope: !36)
!60 = !DILocation(line: 78, column: 9, scope: !36)
!61 = !DILocation(line: 79, column: 36, scope: !36)
!62 = !{!63, !63, i64 0}
!63 = !{!"any pointer", !14, i64 0}
!64 = !DILocation(line: 81, column: 11, scope: !36)
!65 = !DILocation(line: 80, column: 46, scope: !36)
!66 = !DILocation(line: 82, column: 5, scope: !36)
!67 = !DILocation(line: 83, column: 36, scope: !36)
!68 = !DILocation(line: 85, column: 11, scope: !36)
!69 = !DILocation(line: 84, column: 46, scope: !36)
!70 = !DILocation(line: 88, column: 23, scope: !36)
!71 = !DILocation(line: 88, column: 52, scope: !36)
!72 = !DILocation(line: 88, column: 21, scope: !36)
!73 = !DILocation(line: 88, column: 14, scope: !36)
!74 = !DILocation(line: 88, column: 19, scope: !36)
!75 = !{!76, !14, i64 0}
!76 = !{!"svp_simple_021_001_tc_block_data", !14, i64 0, !14, i64 1, !14, i64 2}
!77 = !DILocation(line: 89, column: 21, scope: !36)
!78 = !DILocation(line: 89, column: 50, scope: !36)
!79 = !DILocation(line: 89, column: 19, scope: !36)
!80 = !DILocation(line: 89, column: 14, scope: !36)
!81 = !DILocation(line: 89, column: 17, scope: !36)
!82 = !{!76, !14, i64 1}
!83 = !DILocation(line: 90, column: 28, scope: !36)
!84 = !DILocation(line: 90, column: 57, scope: !36)
!85 = !DILocation(line: 90, column: 26, scope: !36)
!86 = !DILocation(line: 90, column: 14, scope: !36)
!87 = !DILocation(line: 90, column: 24, scope: !36)
!88 = !{!76, !14, i64 2}
!89 = !DILocation(line: 91, column: 3, scope: !36)
!90 = !DILocation(line: 77, column: 35, scope: !36)
!91 = distinct !{!91, !58, !89}
!92 = !DILocation(line: 92, column: 1, scope: !36)
!93 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 94, type: !9, scopeLine: 94, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 96, column: 8, scope: !93)
!95 = !{!96, !96, i64 0}
!96 = !{!"int", !14, i64 0}
!97 = !DILocation(line: 96, column: 34, scope: !93)
!98 = !DILocation(line: 96, column: 40, scope: !93)
!99 = !DILocation(line: 96, column: 7, scope: !93)
!100 = !DILocation(line: 95, column: 46, scope: !93)
!101 = !DILocation(line: 97, column: 1, scope: !93)
