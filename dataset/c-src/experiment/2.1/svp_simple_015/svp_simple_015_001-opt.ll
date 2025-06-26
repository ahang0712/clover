; ModuleID = 'svp_simple_015_001-opt.bc'
source_filename = "./svp_simple_015_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_015_001_global_var1 = common global i32 0, align 4
@svp_simple_015_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_015_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  %1 = call i32 (...) @rand(), !dbg !11
  %2 = call i32 (...) @rand(), !dbg !12
  %3 = call i32 (...) @rand(), !dbg !13
  %4 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !14, !tbaa !15
  %5 = icmp slt i32 %4, %2, !dbg !19
  br i1 %5, label %6, label %11, !dbg !20

6:                                                ; preds = %0
  %7 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !21, !tbaa !15
  %8 = icmp sgt i32 %7, %1, !dbg !22
  br i1 %8, label %9, label %11, !dbg !23

9:                                                ; preds = %6
  %10 = add nsw i32 %1, %2, !dbg !24
  br label %11, !dbg !25

11:                                               ; preds = %9, %6, %0
  %12 = icmp eq i32 %3, 1, !dbg !26
  br i1 %12, label %13, label %15, !dbg !27

13:                                               ; preds = %11
  %14 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !28, !tbaa !15
  br label %17, !dbg !27

15:                                               ; preds = %11
  %16 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !29, !tbaa !15
  br label %17, !dbg !27

17:                                               ; preds = %15, %13
  %18 = phi i32 [ %14, %13 ], [ %16, %15 ], !dbg !27
  ret void, !dbg !30
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @rand(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_015_001_isr_1() #0 !dbg !31 {
  call void (...) @idlerun(), !dbg !32
  store volatile i32 5, i32* @svp_simple_015_001_global_var1, align 4, !dbg !33, !tbaa !15
  store volatile i32 5, i32* @svp_simple_015_001_global_var2, align 4, !dbg !34, !tbaa !15
  ret void, !dbg !35
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_015_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_015")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_015_001_main", scope: !8, file: !8, line: 22, type: !9, scopeLine: 22, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_015_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_015")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 23, column: 3, scope: !7)
!11 = !DILocation(line: 25, column: 11, scope: !7)
!12 = !DILocation(line: 26, column: 11, scope: !7)
!13 = !DILocation(line: 28, column: 11, scope: !7)
!14 = !DILocation(line: 30, column: 8, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 30, column: 39, scope: !7)
!20 = !DILocation(line: 30, column: 44, scope: !7)
!21 = !DILocation(line: 31, column: 8, scope: !7)
!22 = !DILocation(line: 31, column: 39, scope: !7)
!23 = !DILocation(line: 30, column: 7, scope: !7)
!24 = !DILocation(line: 32, column: 11, scope: !7)
!25 = !DILocation(line: 32, column: 5, scope: !7)
!26 = !DILocation(line: 34, column: 5, scope: !7)
!27 = !DILocation(line: 34, column: 3, scope: !7)
!28 = !DILocation(line: 34, column: 12, scope: !7)
!29 = !DILocation(line: 34, column: 45, scope: !7)
!30 = !DILocation(line: 35, column: 1, scope: !7)
!31 = distinct !DISubprogram(name: "svp_simple_015_001_isr_1", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 38, column: 3, scope: !31)
!33 = !DILocation(line: 39, column: 34, scope: !31)
!34 = !DILocation(line: 40, column: 34, scope: !31)
!35 = !DILocation(line: 41, column: 1, scope: !31)
