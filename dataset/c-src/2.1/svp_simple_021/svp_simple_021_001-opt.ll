; ModuleID = 'svp_simple_021_001-opt.bc'
source_filename = "./svp_simple_021_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_init() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  ret void, !dbg !11
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !12 {
  %1 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !13, !tbaa !14
  %2 = zext i16 %1 to i32, !dbg !13
  %3 = icmp sge i32 %2, 16, !dbg !18
  br i1 %3, label %4, label %13, !dbg !13

4:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !19, !tbaa !14
  br label %5, !dbg !20

5:                                                ; preds = %10, %4
  %.0 = phi i32 [ 0, %4 ], [ %11, %10 ], !dbg !21
  %6 = icmp slt i32 %.0, 256, !dbg !22
  br i1 %6, label %7, label %12, !dbg !23

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64, !dbg !24
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %8, !dbg !24
  store volatile i8 0, i8* %9, align 1, !dbg !25, !tbaa !26
  br label %10, !dbg !27

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1, !dbg !28
  br label %5, !dbg !23, !llvm.loop !29

12:                                               ; preds = %5
  br label %13, !dbg !30

13:                                               ; preds = %12, %0
  ret void, !dbg !31
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_main() #0 !dbg !32 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %2) #3, !dbg !33
  call void (...) @init() #3, !dbg !34
  %3 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !36, !tbaa !14
  %4 = zext i16 %3 to i32, !dbg !36
  %5 = icmp sge i32 %4, 16, !dbg !38
  br i1 %5, label %6, label %svp_simple_021_001_RecvTcBlock.exit, !dbg !36

6:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !39, !tbaa !14
  br label %7, !dbg !40

7:                                                ; preds = %9, %6
  %.0.i = phi i32 [ 0, %6 ], [ %12, %9 ], !dbg !41
  %8 = icmp slt i32 %.0.i, 256, !dbg !42
  br i1 %8, label %9, label %13, !dbg !43

9:                                                ; preds = %7
  %10 = sext i32 %.0.i to i64, !dbg !44
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %10, !dbg !44
  store volatile i8 0, i8* %11, align 1, !dbg !45, !tbaa !26
  %12 = add nsw i32 %.0.i, 1, !dbg !46
  br label %7, !dbg !43, !llvm.loop !47

13:                                               ; preds = %7
  br label %svp_simple_021_001_RecvTcBlock.exit, !dbg !49

svp_simple_021_001_RecvTcBlock.exit:              ; preds = %0, %13
  br label %14, !dbg !50

14:                                               ; preds = %35, %svp_simple_021_001_RecvTcBlock.exit
  %.0 = phi i32 [ 0, %svp_simple_021_001_RecvTcBlock.exit ], [ %36, %35 ], !dbg !51
  %15 = icmp slt i32 %.0, 2, !dbg !52
  br i1 %15, label %16, label %37, !dbg !53

16:                                               ; preds = %14
  %17 = icmp eq i32 %.0, 0, !dbg !54
  br i1 %17, label %18, label %20, !dbg !55

18:                                               ; preds = %16
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !56, !tbaa !57
  %19 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !59, !tbaa !14
  store volatile i16 %19, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !60, !tbaa !14
  br label %22, !dbg !61

20:                                               ; preds = %16
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !62, !tbaa !57
  %21 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !63, !tbaa !14
  store volatile i16 %21, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !64, !tbaa !14
  br label %22

22:                                               ; preds = %20, %18
  %23 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !65, !tbaa !57
  %24 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !66
  %25 = load volatile i8, i8* %24, align 1, !dbg !67, !tbaa !26
  %26 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !68
  store i8 %25, i8* %26, align 1, !dbg !69, !tbaa !70
  %27 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !72, !tbaa !57
  %28 = getelementptr inbounds i8, i8* %27, i64 4, !dbg !73
  %29 = load volatile i8, i8* %28, align 1, !dbg !74, !tbaa !26
  %30 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !75
  store i8 %29, i8* %30, align 1, !dbg !76, !tbaa !77
  %31 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !78, !tbaa !57
  %32 = getelementptr inbounds i8, i8* %31, i64 5, !dbg !79
  %33 = load volatile i8, i8* %32, align 1, !dbg !80, !tbaa !26
  %34 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !81
  store i8 %33, i8* %34, align 1, !dbg !82, !tbaa !83
  br label %35, !dbg !84

35:                                               ; preds = %22
  %36 = add nsw i32 %.0, 1, !dbg !85
  br label %14, !dbg !53, !llvm.loop !86

37:                                               ; preds = %14
  %38 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !87
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %38) #3, !dbg !87
  ret void, !dbg !87
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !88 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !89, !tbaa !90
  %2 = lshr i32 %1, 3, !dbg !92
  %3 = and i32 %2, 8191, !dbg !93
  %4 = trunc i32 %3 to i16, !dbg !94
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !95, !tbaa !14
  ret void, !dbg !96
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_021")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_021")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 22, column: 3, scope: !7)
!11 = !DILocation(line: 23, column: 1, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 29, column: 7, scope: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 29, column: 50, scope: !12)
!19 = !DILocation(line: 30, column: 48, scope: !12)
!20 = !DILocation(line: 32, column: 10, scope: !12)
!21 = !DILocation(line: 0, scope: !12)
!22 = !DILocation(line: 32, column: 19, scope: !12)
!23 = !DILocation(line: 32, column: 5, scope: !12)
!24 = !DILocation(line: 33, column: 7, scope: !12)
!25 = !DILocation(line: 33, column: 43, scope: !12)
!26 = !{!16, !16, i64 0}
!27 = !DILocation(line: 34, column: 5, scope: !12)
!28 = !DILocation(line: 32, column: 27, scope: !12)
!29 = distinct !{!29, !23, !27}
!30 = !DILocation(line: 36, column: 3, scope: !12)
!31 = !DILocation(line: 37, column: 1, scope: !12)
!32 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 40, column: 3, scope: !32)
!34 = !DILocation(line: 22, column: 3, scope: !7, inlinedAt: !35)
!35 = distinct !DILocation(line: 42, column: 3, scope: !32)
!36 = !DILocation(line: 29, column: 7, scope: !12, inlinedAt: !37)
!37 = distinct !DILocation(line: 44, column: 3, scope: !32)
!38 = !DILocation(line: 29, column: 50, scope: !12, inlinedAt: !37)
!39 = !DILocation(line: 30, column: 48, scope: !12, inlinedAt: !37)
!40 = !DILocation(line: 32, column: 10, scope: !12, inlinedAt: !37)
!41 = !DILocation(line: 0, scope: !12, inlinedAt: !37)
!42 = !DILocation(line: 32, column: 19, scope: !12, inlinedAt: !37)
!43 = !DILocation(line: 32, column: 5, scope: !12, inlinedAt: !37)
!44 = !DILocation(line: 33, column: 7, scope: !12, inlinedAt: !37)
!45 = !DILocation(line: 33, column: 43, scope: !12, inlinedAt: !37)
!46 = !DILocation(line: 32, column: 27, scope: !12, inlinedAt: !37)
!47 = distinct !{!47, !43, !48}
!48 = !DILocation(line: 34, column: 5, scope: !12, inlinedAt: !37)
!49 = !DILocation(line: 36, column: 3, scope: !12, inlinedAt: !37)
!50 = !DILocation(line: 46, column: 8, scope: !32)
!51 = !DILocation(line: 0, scope: !32)
!52 = !DILocation(line: 46, column: 25, scope: !32)
!53 = !DILocation(line: 46, column: 3, scope: !32)
!54 = !DILocation(line: 47, column: 15, scope: !32)
!55 = !DILocation(line: 47, column: 9, scope: !32)
!56 = !DILocation(line: 48, column: 36, scope: !32)
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !16, i64 0}
!59 = !DILocation(line: 50, column: 11, scope: !32)
!60 = !DILocation(line: 49, column: 46, scope: !32)
!61 = !DILocation(line: 51, column: 5, scope: !32)
!62 = !DILocation(line: 52, column: 36, scope: !32)
!63 = !DILocation(line: 54, column: 11, scope: !32)
!64 = !DILocation(line: 53, column: 46, scope: !32)
!65 = !DILocation(line: 57, column: 23, scope: !32)
!66 = !DILocation(line: 57, column: 52, scope: !32)
!67 = !DILocation(line: 57, column: 21, scope: !32)
!68 = !DILocation(line: 57, column: 14, scope: !32)
!69 = !DILocation(line: 57, column: 19, scope: !32)
!70 = !{!71, !16, i64 0}
!71 = !{!"svp_simple_021_001_tc_block_data", !16, i64 0, !16, i64 1, !16, i64 2}
!72 = !DILocation(line: 58, column: 21, scope: !32)
!73 = !DILocation(line: 58, column: 50, scope: !32)
!74 = !DILocation(line: 58, column: 19, scope: !32)
!75 = !DILocation(line: 58, column: 14, scope: !32)
!76 = !DILocation(line: 58, column: 17, scope: !32)
!77 = !{!71, !16, i64 1}
!78 = !DILocation(line: 59, column: 28, scope: !32)
!79 = !DILocation(line: 59, column: 57, scope: !32)
!80 = !DILocation(line: 59, column: 26, scope: !32)
!81 = !DILocation(line: 59, column: 14, scope: !32)
!82 = !DILocation(line: 59, column: 24, scope: !32)
!83 = !{!71, !16, i64 2}
!84 = !DILocation(line: 60, column: 3, scope: !32)
!85 = !DILocation(line: 46, column: 35, scope: !32)
!86 = distinct !{!86, !53, !84}
!87 = !DILocation(line: 61, column: 1, scope: !32)
!88 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 63, type: !9, scopeLine: 63, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 65, column: 8, scope: !88)
!90 = !{!91, !91, i64 0}
!91 = !{!"int", !16, i64 0}
!92 = !DILocation(line: 65, column: 34, scope: !88)
!93 = !DILocation(line: 65, column: 40, scope: !88)
!94 = !DILocation(line: 65, column: 7, scope: !88)
!95 = !DILocation(line: 64, column: 46, scope: !88)
!96 = !DILocation(line: 66, column: 1, scope: !88)
