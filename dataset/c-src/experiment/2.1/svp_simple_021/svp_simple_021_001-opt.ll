; ModuleID = 'svp_simple_021_001-opt.bc'
source_filename = "./svp_simple_021_001.c"
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
  %3 = call i32 (...) @rand() #3, !dbg !38
  %4 = trunc i32 %3 to i16, !dbg !38
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !40, !tbaa !12
  %5 = call i32 (...) @rand() #3, !dbg !41
  %6 = trunc i32 %5 to i16, !dbg !41
  store volatile i16 %6, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !42, !tbaa !12
  call void (...) @init() #3, !dbg !43
  %7 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !44, !tbaa !12
  %8 = zext i16 %7 to i32, !dbg !44
  %9 = icmp sge i32 %8, 16, !dbg !46
  br i1 %9, label %10, label %svp_simple_021_001_RecvTcBlock.exit, !dbg !44

10:                                               ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !47, !tbaa !12
  br label %11, !dbg !48

11:                                               ; preds = %13, %10
  %.0.i = phi i32 [ 0, %10 ], [ %16, %13 ], !dbg !49
  %12 = icmp slt i32 %.0.i, 256, !dbg !50
  br i1 %12, label %13, label %17, !dbg !51

13:                                               ; preds = %11
  %14 = sext i32 %.0.i to i64, !dbg !52
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %14, !dbg !52
  store volatile i8 0, i8* %15, align 1, !dbg !53, !tbaa !30
  %16 = add nsw i32 %.0.i, 1, !dbg !54
  br label %11, !dbg !51, !llvm.loop !55

17:                                               ; preds = %11
  br label %svp_simple_021_001_RecvTcBlock.exit, !dbg !57

svp_simple_021_001_RecvTcBlock.exit:              ; preds = %0, %17
  br label %18, !dbg !58

18:                                               ; preds = %39, %svp_simple_021_001_RecvTcBlock.exit
  %.0 = phi i32 [ 0, %svp_simple_021_001_RecvTcBlock.exit ], [ %40, %39 ], !dbg !59
  %19 = icmp slt i32 %.0, 2, !dbg !60
  br i1 %19, label %20, label %41, !dbg !61

20:                                               ; preds = %18
  %21 = icmp eq i32 %.0, 0, !dbg !62
  br i1 %21, label %22, label %24, !dbg !63

22:                                               ; preds = %20
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !64, !tbaa !65
  %23 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !67, !tbaa !12
  store volatile i16 %23, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !68, !tbaa !12
  br label %26, !dbg !69

24:                                               ; preds = %20
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !70, !tbaa !65
  %25 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !71, !tbaa !12
  store volatile i16 %25, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !72, !tbaa !12
  br label %26

26:                                               ; preds = %24, %22
  %27 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !73, !tbaa !65
  %28 = getelementptr inbounds i8, i8* %27, i64 2, !dbg !74
  %29 = load volatile i8, i8* %28, align 1, !dbg !75, !tbaa !30
  %30 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !76
  store i8 %29, i8* %30, align 1, !dbg !77, !tbaa !78
  %31 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !80, !tbaa !65
  %32 = getelementptr inbounds i8, i8* %31, i64 4, !dbg !81
  %33 = load volatile i8, i8* %32, align 1, !dbg !82, !tbaa !30
  %34 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !83
  store i8 %33, i8* %34, align 1, !dbg !84, !tbaa !85
  %35 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !86, !tbaa !65
  %36 = getelementptr inbounds i8, i8* %35, i64 5, !dbg !87
  %37 = load volatile i8, i8* %36, align 1, !dbg !88, !tbaa !30
  %38 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !89
  store i8 %37, i8* %38, align 1, !dbg !90, !tbaa !91
  br label %39, !dbg !92

39:                                               ; preds = %26
  %40 = add nsw i32 %.0, 1, !dbg !93
  br label %18, !dbg !61, !llvm.loop !94

41:                                               ; preds = %18
  %42 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !95
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %42) #3, !dbg !95
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !96 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !97, !tbaa !98
  %2 = lshr i32 %1, 3, !dbg !100
  %3 = and i32 %2, 8191, !dbg !101
  %4 = trunc i32 %3 to i16, !dbg !102
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !103, !tbaa !12
  ret void, !dbg !104
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_021")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_021")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 34, column: 48, scope: !7)
!11 = !DILocation(line: 34, column: 46, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 35, column: 48, scope: !7)
!17 = !DILocation(line: 35, column: 46, scope: !7)
!18 = !DILocation(line: 37, column: 3, scope: !7)
!19 = !DILocation(line: 38, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 40, type: !9, scopeLine: 40, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 44, column: 7, scope: !20)
!22 = !DILocation(line: 44, column: 50, scope: !20)
!23 = !DILocation(line: 45, column: 48, scope: !20)
!24 = !DILocation(line: 47, column: 10, scope: !20)
!25 = !DILocation(line: 0, scope: !20)
!26 = !DILocation(line: 47, column: 19, scope: !20)
!27 = !DILocation(line: 47, column: 5, scope: !20)
!28 = !DILocation(line: 48, column: 7, scope: !20)
!29 = !DILocation(line: 48, column: 43, scope: !20)
!30 = !{!14, !14, i64 0}
!31 = !DILocation(line: 49, column: 5, scope: !20)
!32 = !DILocation(line: 47, column: 27, scope: !20)
!33 = distinct !{!33, !27, !31}
!34 = !DILocation(line: 51, column: 3, scope: !20)
!35 = !DILocation(line: 52, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 55, column: 3, scope: !36)
!38 = !DILocation(line: 34, column: 48, scope: !7, inlinedAt: !39)
!39 = distinct !DILocation(line: 57, column: 3, scope: !36)
!40 = !DILocation(line: 34, column: 46, scope: !7, inlinedAt: !39)
!41 = !DILocation(line: 35, column: 48, scope: !7, inlinedAt: !39)
!42 = !DILocation(line: 35, column: 46, scope: !7, inlinedAt: !39)
!43 = !DILocation(line: 37, column: 3, scope: !7, inlinedAt: !39)
!44 = !DILocation(line: 44, column: 7, scope: !20, inlinedAt: !45)
!45 = distinct !DILocation(line: 59, column: 3, scope: !36)
!46 = !DILocation(line: 44, column: 50, scope: !20, inlinedAt: !45)
!47 = !DILocation(line: 45, column: 48, scope: !20, inlinedAt: !45)
!48 = !DILocation(line: 47, column: 10, scope: !20, inlinedAt: !45)
!49 = !DILocation(line: 0, scope: !20, inlinedAt: !45)
!50 = !DILocation(line: 47, column: 19, scope: !20, inlinedAt: !45)
!51 = !DILocation(line: 47, column: 5, scope: !20, inlinedAt: !45)
!52 = !DILocation(line: 48, column: 7, scope: !20, inlinedAt: !45)
!53 = !DILocation(line: 48, column: 43, scope: !20, inlinedAt: !45)
!54 = !DILocation(line: 47, column: 27, scope: !20, inlinedAt: !45)
!55 = distinct !{!55, !51, !56}
!56 = !DILocation(line: 49, column: 5, scope: !20, inlinedAt: !45)
!57 = !DILocation(line: 51, column: 3, scope: !20, inlinedAt: !45)
!58 = !DILocation(line: 61, column: 8, scope: !36)
!59 = !DILocation(line: 0, scope: !36)
!60 = !DILocation(line: 61, column: 25, scope: !36)
!61 = !DILocation(line: 61, column: 3, scope: !36)
!62 = !DILocation(line: 62, column: 15, scope: !36)
!63 = !DILocation(line: 62, column: 9, scope: !36)
!64 = !DILocation(line: 63, column: 36, scope: !36)
!65 = !{!66, !66, i64 0}
!66 = !{!"any pointer", !14, i64 0}
!67 = !DILocation(line: 65, column: 11, scope: !36)
!68 = !DILocation(line: 64, column: 46, scope: !36)
!69 = !DILocation(line: 66, column: 5, scope: !36)
!70 = !DILocation(line: 67, column: 36, scope: !36)
!71 = !DILocation(line: 69, column: 11, scope: !36)
!72 = !DILocation(line: 68, column: 46, scope: !36)
!73 = !DILocation(line: 72, column: 23, scope: !36)
!74 = !DILocation(line: 72, column: 52, scope: !36)
!75 = !DILocation(line: 72, column: 21, scope: !36)
!76 = !DILocation(line: 72, column: 14, scope: !36)
!77 = !DILocation(line: 72, column: 19, scope: !36)
!78 = !{!79, !14, i64 0}
!79 = !{!"svp_simple_021_001_tc_block_data", !14, i64 0, !14, i64 1, !14, i64 2}
!80 = !DILocation(line: 73, column: 21, scope: !36)
!81 = !DILocation(line: 73, column: 50, scope: !36)
!82 = !DILocation(line: 73, column: 19, scope: !36)
!83 = !DILocation(line: 73, column: 14, scope: !36)
!84 = !DILocation(line: 73, column: 17, scope: !36)
!85 = !{!79, !14, i64 1}
!86 = !DILocation(line: 74, column: 28, scope: !36)
!87 = !DILocation(line: 74, column: 57, scope: !36)
!88 = !DILocation(line: 74, column: 26, scope: !36)
!89 = !DILocation(line: 74, column: 14, scope: !36)
!90 = !DILocation(line: 74, column: 24, scope: !36)
!91 = !{!79, !14, i64 2}
!92 = !DILocation(line: 75, column: 3, scope: !36)
!93 = !DILocation(line: 61, column: 35, scope: !36)
!94 = distinct !{!94, !61, !92}
!95 = !DILocation(line: 76, column: 1, scope: !36)
!96 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 78, type: !9, scopeLine: 78, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 80, column: 8, scope: !96)
!98 = !{!99, !99, i64 0}
!99 = !{!"int", !14, i64 0}
!100 = !DILocation(line: 80, column: 34, scope: !96)
!101 = !DILocation(line: 80, column: 40, scope: !96)
!102 = !DILocation(line: 80, column: 7, scope: !96)
!103 = !DILocation(line: 79, column: 46, scope: !96)
!104 = !DILocation(line: 81, column: 1, scope: !96)
