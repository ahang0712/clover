; ModuleID = 'svp_simple_022_001-opt.bc'
source_filename = "./svp_simple_022_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  call void @disable_isr(i32 -1) #3, !dbg !10
  call void (...) @init() #3, !dbg !13
  call void @enable_isr(i32 -1) #3, !dbg !14
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !15, !tbaa !16
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !20, !tbaa !16
  %2 = icmp sge i32 %1, 12, !dbg !25
  br i1 %2, label %3, label %4, !dbg !20

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !26, !tbaa !16
  br label %svp_simple_022_001_func_1.exit, !dbg !27

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !28, !tbaa !16
  br label %svp_simple_022_001_func_1.exit

svp_simple_022_001_func_1.exit:                   ; preds = %3, %4
  br label %5, !dbg !29

5:                                                ; preds = %10, %svp_simple_022_001_func_1.exit
  %.0 = phi i32 [ 0, %svp_simple_022_001_func_1.exit ], [ %11, %10 ], !dbg !30
  %6 = icmp slt i32 %.0, 256, !dbg !31
  br i1 %6, label %7, label %12, !dbg !32

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64, !dbg !33
  %9 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %8, !dbg !33
  store volatile i32 0, i32* %9, align 4, !dbg !34, !tbaa !16
  br label %10, !dbg !35

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1, !dbg !36
  br label %5, !dbg !32, !llvm.loop !37

12:                                               ; preds = %5
  %13 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !38, !tbaa !16
  store volatile i32 %13, i32* @svp_simple_022_001_global_var3, align 4, !dbg !43, !tbaa !16
  %14 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !44, !tbaa !16
  store volatile i32 %14, i32* @svp_simple_022_001_global_var3, align 4, !dbg !45, !tbaa !16
  ret void, !dbg !46
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !11 {
  call void @disable_isr(i32 -1), !dbg !47
  call void (...) @init(), !dbg !48
  call void @enable_isr(i32 -1), !dbg !49
  ret void, !dbg !50
}

declare void @disable_isr(i32) #2

declare void @init(...) #2

declare void @enable_isr(i32) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !23 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !51, !tbaa !16
  %2 = icmp sge i32 %1, 12, !dbg !53
  br i1 %2, label %3, label %4, !dbg !51

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !54, !tbaa !16
  br label %svp_simple_022_001_func_3.exit, !dbg !55

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !56, !tbaa !16
  br label %svp_simple_022_001_func_3.exit

svp_simple_022_001_func_3.exit:                   ; preds = %3, %4
  ret void, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !41 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !58, !tbaa !16
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !60, !tbaa !16
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !21 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !62, !tbaa !16
  %2 = icmp sge i32 %1, 12, !dbg !63
  br i1 %2, label %3, label %4, !dbg !62

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !64, !tbaa !16
  br label %5, !dbg !65

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !66, !tbaa !16
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !67
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !39 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !68, !tbaa !16
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !69, !tbaa !16
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !71 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !72, !tbaa !16
  ret void, !dbg !73
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_022")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_022")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 28, column: 3, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 15, column: 3, scope: !7)
!13 = !DILocation(line: 33, column: 3, scope: !11, inlinedAt: !12)
!14 = !DILocation(line: 34, column: 3, scope: !11, inlinedAt: !12)
!15 = !DILocation(line: 17, column: 34, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 42, column: 7, scope: !21, inlinedAt: !22)
!21 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 41, type: !9, scopeLine: 41, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = distinct !DILocation(line: 37, column: 36, scope: !23, inlinedAt: !24)
!23 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = distinct !DILocation(line: 18, column: 3, scope: !7)
!25 = !DILocation(line: 42, column: 38, scope: !21, inlinedAt: !22)
!26 = !DILocation(line: 43, column: 36, scope: !21, inlinedAt: !22)
!27 = !DILocation(line: 44, column: 3, scope: !21, inlinedAt: !22)
!28 = !DILocation(line: 45, column: 36, scope: !21, inlinedAt: !22)
!29 = !DILocation(line: 20, column: 8, scope: !7)
!30 = !DILocation(line: 0, scope: !7)
!31 = !DILocation(line: 20, column: 17, scope: !7)
!32 = !DILocation(line: 20, column: 3, scope: !7)
!33 = !DILocation(line: 21, column: 5, scope: !7)
!34 = !DILocation(line: 21, column: 40, scope: !7)
!35 = !DILocation(line: 22, column: 3, scope: !7)
!36 = !DILocation(line: 20, column: 25, scope: !7)
!37 = distinct !{!37, !32, !35}
!38 = !DILocation(line: 50, column: 36, scope: !39, inlinedAt: !40)
!39 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = distinct !DILocation(line: 39, column: 36, scope: !41, inlinedAt: !42)
!41 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = distinct !DILocation(line: 23, column: 3, scope: !7)
!43 = !DILocation(line: 50, column: 34, scope: !39, inlinedAt: !40)
!44 = !DILocation(line: 24, column: 36, scope: !7)
!45 = !DILocation(line: 24, column: 34, scope: !7)
!46 = !DILocation(line: 25, column: 1, scope: !7)
!47 = !DILocation(line: 28, column: 3, scope: !11)
!48 = !DILocation(line: 33, column: 3, scope: !11)
!49 = !DILocation(line: 34, column: 3, scope: !11)
!50 = !DILocation(line: 35, column: 1, scope: !11)
!51 = !DILocation(line: 42, column: 7, scope: !21, inlinedAt: !52)
!52 = distinct !DILocation(line: 37, column: 36, scope: !23)
!53 = !DILocation(line: 42, column: 38, scope: !21, inlinedAt: !52)
!54 = !DILocation(line: 43, column: 36, scope: !21, inlinedAt: !52)
!55 = !DILocation(line: 44, column: 3, scope: !21, inlinedAt: !52)
!56 = !DILocation(line: 45, column: 36, scope: !21, inlinedAt: !52)
!57 = !DILocation(line: 37, column: 65, scope: !23)
!58 = !DILocation(line: 50, column: 36, scope: !39, inlinedAt: !59)
!59 = distinct !DILocation(line: 39, column: 36, scope: !41)
!60 = !DILocation(line: 50, column: 34, scope: !39, inlinedAt: !59)
!61 = !DILocation(line: 39, column: 65, scope: !41)
!62 = !DILocation(line: 42, column: 7, scope: !21)
!63 = !DILocation(line: 42, column: 38, scope: !21)
!64 = !DILocation(line: 43, column: 36, scope: !21)
!65 = !DILocation(line: 44, column: 3, scope: !21)
!66 = !DILocation(line: 45, column: 36, scope: !21)
!67 = !DILocation(line: 47, column: 1, scope: !21)
!68 = !DILocation(line: 50, column: 36, scope: !39)
!69 = !DILocation(line: 50, column: 34, scope: !39)
!70 = !DILocation(line: 51, column: 1, scope: !39)
!71 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 53, column: 34, scope: !71)
!73 = !DILocation(line: 54, column: 1, scope: !71)
